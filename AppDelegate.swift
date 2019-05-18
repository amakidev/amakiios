//
//  AppDelegate.swift
//  Catao
//
//  Created by Catao on 18/12/2017.
//  Copyright © 2017 Catao. All rights reserved.
//

import UIKit
import Crashlytics
import Fabric
import Firebase
import UserNotifications
import FirebaseInstanceID
import FirebaseMessaging
import LGSideMenuController
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.isStatusBarHidden = false
        setupRootWindow()
        setupCrashlytics()
        setupNavbar()
        GMSServices.provideAPIKey("AIzaSyDo1G5HVXjCCDgphmj5wxx0DzHC0wVMR90")
//        setupFirebaseNotifications(app: application)
        return true
    }
   
    //Use this function only if the color of the Navigation is fixed.
    // MARK: - Navbar
    func setupNavbar(){
//        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.black]
    }
    
    // MARK: - Firebase
    func setupFirebase(){
        FirebaseApp.configure()
    }
    
    // MARK: - Crashlytics
    func setupCrashlytics(){
        Fabric.with([Crashlytics.self])
    }

    // MARK: - Firebase Push Notifications
    func setupFirebaseNotifications(app: UIApplication){
       
        setupFirebase()
        
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
            Messaging.messaging().delegate = self
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            app.registerUserNotificationSettings(settings)
        }
        
        app.registerForRemoteNotifications()
    }
    
    
    // MARK: - RootWindow
    func setupRootWindow(){
        self.window = UIWindow(frame: UIScreen.main.bounds);
        
//        if UserDefaults.standard.string(forKey: KEY_USER_TOKEN) != nil {
//            self.window?.rootViewController = getHomeViewController()
//        } else {
            let loginVC = HomeViewController()
            let nav = UINavigationController(rootViewController: loginVC)
            nav.navigationBar.tintColor = UIColor.white
            self.window?.rootViewController = nav
//        }
    
        self.window?.makeKeyAndVisible();
        
    }
    
    func getHomeViewController() -> UIViewController {
//        let rootVC = HomeViewController()
//        let leftViewController = SideMenuViewController()
//
//        let navController = UINavigationController(rootViewController: rootVC)
//        navController.navigationBar.tintColor = .white
//        navController.navigationBar.backgroundColor = .white
//
//        let sideMenuController = LGSideMenuController(rootViewController: navController,
//                                                      leftViewController: leftViewController,
//                                                      rightViewController: nil)
//        sideMenuController.isLeftViewSwipeGestureEnabled = true
//        sideMenuController.delegate = leftViewController as? LGSideMenuDelegate
//        sideMenuController.leftViewCoverBlurEffect = UIBlurEffect(style: .regular)
//        sideMenuController.leftViewBackgroundColor = Colors.MAIN_COLOR
//        sideMenuController.leftViewWidth = 238.0
//        sideMenuController.leftViewPresentationStyle = .scaleFromBig
//
//        return sideMenuController
        return UIViewController()
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print(userInfo)
        completionHandler(UIBackgroundFetchResult.newData)
        
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
    // This method will be called when app received push notifications in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.alert, .badge, .sound])
    }

}

extension AppDelegate : MessagingDelegate {
    func application(received remoteMessage: MessagingRemoteMessage) {
        
    }
    
    // [START refresh_token]
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
//        AccountManager.registerToken()
    }
    
}

