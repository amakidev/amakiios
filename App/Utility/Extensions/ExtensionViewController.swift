//
//  ViewControllerCatao.swift
//  Catao
//
//  Created by Catao on 18/12/2017.
//  Copyright © 2017 Catao. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import MobileCoreServices
import MapKit

private var loaderViewAssociationKey: NVActivityIndicatorView?

enum VersionError: Error {
    case invalidResponse, invalidBundleInfo
}

extension UIViewController {
    
    var loaderView: NVActivityIndicatorView! {
        get { return objc_getAssociatedObject(self, &loaderViewAssociationKey) as? NVActivityIndicatorView }
        set(newValue) { objc_setAssociatedObject(self, &loaderViewAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN) }
    }
    
    
    // MARK: - AutoScrollWhenKeyboardShowsUp
    /**
     Sobe a scrollview quando o teclado aparece. Normalmente utilizado em formulários
     O TextField deve estar dentro de uma scrollView
     Não se esqueça de dar override no setScrollViewContentInset e dar removeObservers() no viewDidDisappear
     */
    
    func setupAutoScrollWhenKeyboardShowsUp() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(gesture:)))
        self.view.addGestureRecognizer(tapGesture)
        addObservers()
    }
    
    @objc func didTapView(gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func addObservers(){
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: nil) { (notification) in
            self.keyboardWillShow(notification: notification)
        }
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: nil) { (notification) in
            self.keyboardWillHide(notification: notification)
        }
    }
    
    func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return
        }
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
        setScrollViewContentInset(contentInset)
    }
    
    func keyboardWillHide(notification: Notification) {
        setScrollViewContentInset(UIEdgeInsets.zero)
    }
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    // OVERRIDE IT!
    @objc func setScrollViewContentInset(_ inset: UIEdgeInsets) {
        
    }
    
    // MARK: - ShowModal
    func showModal(viewController controller: UIViewController) {
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .crossDissolve
        self.present(controller, animated: true, completion: nil)
    }
    
    // MARK: - Alert
    
    func showNotImplementedAlert(){
        showAlert(title: "Alerta", message: "Função não implementada!", okBlock: nil, cancelBlock: nil)
    }
    
    func showSuccessAlert(message: String, okBlock:(() -> Void)?, cancelBlock: (() -> Void)?){
        showAlert(title: "Sucesso", message: message, okBlock: okBlock, cancelBlock: cancelBlock)
    }
    
    func showSuccessAlert(message: String){
        showAlert(title: "Sucesso", message: message, okBlock: nil, cancelBlock: nil)
    }
    
    func showErrorAlert(message: String){
        showAlert(title: "Oops!", message: message, okBlock: nil, cancelBlock: nil)
    }
    
    func showErrorAlert(message: String, okBlock:(() -> Void)?, cancelBlock: (() -> Void)?){
        showAlert(title: "Erro", message: message, okBlock: okBlock, cancelBlock: cancelBlock)
    }
    
    func verifyUserLoggedAlert(loggedBlock: (()->Void)?) {
        if isUserLogged() {
            loggedBlock?()
        } else {
            self.showAlert(title: "Deseja fazer login agora?", message: "Para acesso a esta funcionalidade, você deve ser cliente e efetuar seu login.", okBlock: {
                let loginVC = LoginViewController()
                let nav = UINavigationController(rootViewController: loginVC)
                nav.navigationBar.tintColor = UIColor.white
                UIApplication.shared.windows.first?.rootViewController = nav
            }) {
                // do nothing
            }
        }
    }
    
    func showAlert(title: String, message: String, okBlock:(() -> Void)?, cancelBlock: (() -> Void)?){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        var titleOkAction = "Ok"
        var titleCancelAction = "Cancelar"
        
        if (cancelBlock != nil) {
            titleOkAction = "Sim"
            titleCancelAction = "Não"
        }
        
        
        let ok = UIAlertAction(title: titleOkAction, style: .default) { (action) in
            if let okBl = okBlock {
                okBl()
            }
            alert.dismiss(animated: true, completion: nil);
        }
        
        alert.addAction(ok)
        
        if let cancelBl = cancelBlock {
            let cancel = UIAlertAction(title: titleCancelAction, style: .cancel) { (action) in
                cancelBl()
            }
            alert.addAction(cancel)
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Loader
    /**
     Github: https://github.com/ninjaprox/NVActivityIndicatorView
     Mostra o loader na tela. Cor default = MAIN_COLOR
     Escolha um estilo (listados no github)
     */
    func showLoader() {
        
        if(loaderView == nil) {
            loaderView = NVActivityIndicatorView(frame: CGRect(x: (UIScreen.main.bounds.size.width/2) - 15, y: UIScreen.main.bounds.size.height/2, width: 35, height: 35) , type: NVActivityIndicatorType.circleStrokeSpin, color: Colors.MAIN_COLOR, padding: 0)
        }
        
        self.lockView(self.view)
        
        if(loaderView.isAnimating == false){
            loaderView.startAnimating()
        }
        
        if self.navigationController ==  nil {
            self.view.addSubview(loaderView)
        }
        else {
            self.navigationController?.view.addSubview(loaderView)
        }
        
    }
    
    func hideLoader () {
        if(loaderView != nil){
            self.unlockView(self.view)
            loaderView.stopAnimating()
            loaderView.removeFromSuperview()
        }
    }
    
    //show loader over modal
    func showModalLoader() {
        
        if(loaderView == nil) {
            loaderView = NVActivityIndicatorView(frame: CGRect(x: (UIScreen.main.bounds.size.width/2) - 15, y: UIScreen.main.bounds.size.height/2, width: 35, height: 35) , type: NVActivityIndicatorType.ballTrianglePath, color: Colors.MAIN_COLOR, padding: 0)
        }
        
        loaderView.startAnimating()
        self.view.addSubview(loaderView)
    }
    
    // MARK: - navigation
    /**
     Retira o texto do back no navigationItem. Fica apenas a seta "<"
     */
    func setupBack() {
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
    }
    
    
    // MARK: - Views
    /**
     Desativa a interação do usuário naquela view
     */
    func lockView(_ view: UIView){
        view.isUserInteractionEnabled = false
    }
    
    func unlockView(_ view: UIView) {
        view.isUserInteractionEnabled = true
    }
    
    // MARK: - RegisterNib
    /**
     Registra a nib na tableView
     */
    func registerNibInTableView(_ tableView: UITableView, nibName: String){
        tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    /**
     Registra a nib na collectionView
     */
    func registerNibInCollectionView(_ collectionView: UICollectionView, nibName: String){
        collectionView.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
}
