//
//  APIManager.swift
//  Catao
//
//  Created by Catao on 18/12/2017.
//  Copyright © 2017 Catao. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    static let ERROR_UNKNOW = "Erro desconhecido"
    
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
 
    static func postToAPIService(baseURL: String? = nil, service: String, params: [String: Any]?, success: ((String) -> Void)? , error: ((String, Int) -> Void)? ){
        
        if(isConnectedToInternet){
            var parameters: [String: Any] = [:]
            if let p = params {
                parameters = p
            } else if let token = UserDefaults.standard.string(forKey: KEY_USER_TOKEN) {
                parameters["token"] = token
            }
            Alamofire.request((baseURL == nil) ? API_URL + service : baseURL! + service, method: .post, parameters: parameters, encoding:
                JSONEncoding.default).responseString(completionHandler: { (response) in
                    self.responseBlock(response: response, success: { (data) in
                        success?(data)
                    }, error: { (errorMessage, status) in
                        error?(errorMessage, status)
                    })
                })
            
        } else {
            error?("Ocorreu um erro durante a operação. Verifique sua conexão e tente mais tarde. Se o problema persistir entre em contato conosco.", ERROR_NOT_CONNECTED)
        }
        
        
    }
    
    
    static func getToAPIService(service: String, params: [String: Any]?, success: ((String) -> Void)? , error: ((String, Int) -> Void)? ){
        
        if(isConnectedToInternet){
            var parameters: [String: Any] = [:]
            if let p = params {
                parameters = p
            } else if let token = UserDefaults.standard.string(forKey: KEY_USER_TOKEN) {
                parameters["token"] = token
            }
            Alamofire.request(API_URL + service, method:.get, parameters: parameters).responseString { response in
                
                self.responseBlock(response: response, success: { (data) in
                    success?(data)
                }, error: { (errorMessage, status) in
                    error?(errorMessage, status)
                })
                
            }
            
            
        } else {
            if let errorBlock = error {
                errorBlock("Ocorreu um erro durante a operação. Verifique sua conexão e tente mais tarde. Se o problema persistir entre em contato conosco.", ERROR_NOT_CONNECTED)
            }
        }
        
    }
    
    static func putToAPIService(service: String, params: [String: Any]?, success: ((String) -> Void)? , error: ((String, Int) -> Void)? ){
        
        if(isConnectedToInternet){
            
            Alamofire.request(API_URL + service, method: .put, parameters: params, encoding: JSONEncoding.default).responseString(completionHandler: { (response) in
                
                self.responseBlock(response: response, success: { (data) in
                    success?(data)
                }, error: { (errorMessage, status) in
                    error?(errorMessage, status)
                })
                
            })
            
        }
        else {
            if let errorBlock = error {
                errorBlock("Ocorreu um erro durante a operação. Verifique sua conexão e tente mais tarde. Se o problema persistir entre em contato conosco.", ERROR_NOT_CONNECTED)
            }
        }
        
    }
    
    static func deleteToAPIService(service: String, params: [String: Any]?, success: ((String) -> Void)? , error: ((String, Int) -> Void)? ){
        
        
        if(isConnectedToInternet){
            
            Alamofire.request(API_URL + service, method: .delete, parameters: params, encoding: JSONEncoding.default).responseString(completionHandler: { (response) in
                
                self.responseBlock(response: response, success: { (data) in
                    success?(data)
                }, error: { (errorMessage, status) in
                    error?(errorMessage, status)
                })
                
            })
            
        } else {
            if let errorBlock = error {
                errorBlock("Ocorreu um erro durante a operação. Verifique sua conexão e tente mais tarde. Se o problema persistir entre em contato conosco.", ERROR_NOT_CONNECTED)
            }
        }
        
        
    }
    
    static func postToAPIService(image: UIImage?, imageParamName: String, video: URL?, video_thumb: UIImage?, service: String, params: [String: Any]?, success: ((String) -> Void)?, progress: ((Double) -> Void)?, error: ((String, Int) -> Void)?) {
        
        
        if(isConnectedToInternet){
            
            Alamofire.upload(multipartFormData: { multipartFormData in
                
                if let img = image {
                    let imgData = UIImageJPEGRepresentation(img, 0.5)!
                    multipartFormData.append(imgData, withName: imageParamName, fileName: "file.jpg", mimeType: "image/jpg")
                }
                
                if let videoURL = video , let videoThumb = video_thumb{
                    multipartFormData.append(videoURL, withName: "video")
                    let imgData = UIImageJPEGRepresentation(videoThumb, 0.5)!
                    multipartFormData.append(imgData, withName: "video_thumb", fileName: "file.jpg", mimeType: "image/jpg")
                }
                
                if let parameters = params {
                    
                    for (key, value) in parameters {
                        if value is String {
                            multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
                        }
                        else if let val = value as? NSNumber {
                            let strValue = String(format:"%f", val.floatValue)
                            multipartFormData.append(strValue.data(using: .utf8)!, withName: key)
                        }
                        
                    }
                }
                
            }, to: API_URL + service )
            { (result) in
                switch result {
                case .success(let upload, _, _):
                    
                    upload.uploadProgress(closure: { (progressVal) in
                        if let progressBlock = progress {
                            progressBlock(progressVal.fractionCompleted)
                        }
                    })
                    
                    upload.responseString { response in
                        self.responseBlock(response: response, success: { (data) in
                            success?(data)
                        }, error: { (errorMessage, status) in
                            error?(errorMessage, status)
                        })
                    }
                    
                case .failure(let encodingError):
                    print(encodingError)
                    if let errorBlock = error {
                        errorBlock("Erro desconhecido", 400)
                    }
                }
            }
            
            
        } else {
            if let errorBlock = error {
                errorBlock("Ocorreu um erro durante a operação. Verifique sua conexão e tente mais tarde. Se o problema persistir entre em contato conosco.", ERROR_NOT_CONNECTED)
            }
        }
        
    }
    
    
    // MARK: - Response Block
    static func responseBlock(response: DataResponse<String>, success: ((String) -> Void)? , error: ((String, Int) -> Void)?) {
        switch response.result {
        case .success (let data):
            
//            print(data)
            if let statusCode = response.response?.statusCode, (statusCode < 200 || statusCode >= 300) {
                if let errorBlock = error {
                    let errorJson = ErrorResponse(json: data)
                    if let resp = response.response {
                        if(resp.statusCode == 401){
                            if(response.request?.url?.absoluteString.contains("/auth") == true) {
                                errorBlock(errorJson.msgExterna ?? ERROR_UNKNOW, resp.statusCode)
                            } else {
                                if let nav = UIApplication.shared.windows.first?.rootViewController as? UINavigationController {
                                    if nav.viewControllers.first is LoginViewController == false {
                                        let lvc = LoginViewController()
//                                        lvc.setExpiredSession()
                                        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: lvc)
                                    }
                                } else {
                                    let lvc = LoginViewController()
//                                    lvc.setExpiredSession()
                                    UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: lvc)
                                }
                            }
                        } else if(data != ""){
                            errorBlock(errorJson.msgExterna ?? ERROR_UNKNOW, resp.statusCode)
                        } else {
                            errorBlock(errorJson.msgExterna ?? ERROR_UNKNOW, resp.statusCode)
                        }
                    } else {
                        errorBlock(errorJson.msgExterna ?? ERROR_UNKNOW, 400)
                    }
                }
            }
            else if let successBlock = success {
                let errorJson = ErrorResponse(json: data)
                if errorJson.msgExterna != nil && errorJson.msgExterna != "" {
                    error?(errorJson.msgExterna!, 400)
                } else {
                    successBlock(data)
                }
            }
            
            break
            
        case .failure:
            
            if let errorBlock = error {
                if let resp = response.response {
                    if(resp.statusCode == 401){
                        let lvc = LoginViewController()
//                        lvc.setExpiredSession()
                        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: lvc)
                    } else {
                        errorBlock("Erro desconhecido", resp.statusCode)
                    }
                } else {
                    errorBlock("Erro desconhecido", 400)
                }
            }
            break
        }
    }
    
}
