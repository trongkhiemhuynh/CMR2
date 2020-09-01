//
//  ViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/5/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import Alamofire

//import NVActivityIndicatorView
import SkyFloatingLabelTextField

class LoginViewController : BaseViewController {

    @IBOutlet weak var tfUserName: SkyFloatingLabelTextField!
    
    @IBOutlet weak var tfPassword: SkyFloatingLabelTextField!
    
    @IBOutlet weak var btnLogin : UIButton!
    
    @IBOutlet weak var btnCheckbox : UIButton!
    
    var isCheck = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    override func setupView() {
        tfUserName.placeholder = "Username"
        tfUserName.title = "Username"
        
        tfPassword.placeholder = "Password"
        tfPassword.title = "Password"
        tfPassword.isSecureTextEntry = true
        btnLogin.layer.cornerRadius = 8
        
        let tapRecognization = UITapGestureRecognizer(target: self, action: #selector(self.tapDismiss(gesture:)))
        self.view.addGestureRecognizer(tapRecognization)
    }
    
    @objc func tapDismiss(gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @IBAction func loginAction(_ sender : AnyObject) {
        
//        addAlertLoading()
//        test()
//        AF.request("http://172.23.90.170:8000/api/login/",
//                   method: .post,
//                   parameters: parameters,
//                   encoder: JSONEncoding.default,
//                   headers:nil).response { response in
//            debugPrint(response)
//        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
////            nvActivity.stopAnimating()
//            self.dismissAlertLoading()
//
//
//        }

        
        let vc = WelcomeViewController()
        present(vc, animated: true, completion: nil)
//
        
    }
    
    func getData() {
        var exampleParameters : [String : String] = ["email" : tfUserName.text ?? "", "pass":tfPassword.text ?? ""]
        
        //        exampleParameters["a"] = ["a1": "v1","a2": "v2"]
        
        debugPrint(exampleParameters.description)
        
        let devUrlPush = URL.init(string:"http://172.23.90.170:8000/api/login/")
        
        var request = URLRequest(url: devUrlPush!)
        request.httpMethod = "POST"
//        request.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            try request.setMultipartFormData(exampleParameters, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
        
//        request.httpBody = createBody(parameters: exampleParameters)
        
        AF.request(request).responseJSON { (response) in
            
            debugPrint(response)
            
            if( response != nil)
            {
                let jsonDecoder = JSONDecoder()
                guard let item = try? jsonDecoder.decode(LoginItem.self, from: response.data!) else {return}
                print("---token---",item.token)
                
                let userDF = UserDefaults.standard
                userDF.set(item.token, forKey: "token")
                userDF.synchronize()
                
                
                
            }else
            {
                print("---error :",response.error?.localizedDescription)
            }
        }
        
        //        let string = String(data: request.httpBody!, encoding: .utf8)
        //        let jsonString = JSON(data: request.httpBody!)
        //        debugPrint(jsonString.rawString(.utf8, options: .prettyPrinted))
        //        debugPrint(string)
    }

    
    @IBAction func actionCheck() {
        isCheck = !isCheck
        
        if (isCheck) {
            btnCheckbox.setImage(UIImage(named: "checked_box"), for: .normal)
        } else {
            btnCheckbox.setImage(UIImage(named: "check_box"), for: .normal)
        }
        
    }
    
    func createBody(parameters: [String: String]) -> Data {
        let body = NSMutableData()
        
//        let boundaryPrefix = "--\(boundary)\r\n"
        
        for (key, value) in parameters {
//            body.appendString(boundaryPrefix)
            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString("\(value)\r\n")
        }
        
//        body.appendString(boundaryPrefix)
//        body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n")
////        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
////        body.append(data)
//        body.appendString("\r\n")
//        body.appendString("--".appending(boundary.appending("--")))
        
        return body as Data
    }

}

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}

extension URLRequest {

    /**
     Configures the URL request for `multipart/form-data`. The request's `httpBody` is set, and a value is set for the HTTP header field `Content-Type`.
     
     - Parameter parameters: The form data to set.
     - Parameter encoding: The encoding to use for the keys and values.
     
     - Throws: `MultipartFormDataEncodingError` if any keys or values in `parameters` are not entirely in `encoding`.
     
     - Note: The default `httpMethod` is `GET`, and `GET` requests do not typically have a response body. Remember to set the `httpMethod` to e.g. `POST` before sending the request.
     - Seealso: https://html.spec.whatwg.org/multipage/form-control-infrastructure.html#multipart-form-data
     */
    public mutating func setMultipartFormData(_ parameters: [String: String], encoding: String.Encoding) throws {

        let makeRandom = { UInt32.random(in: (.min)...(.max)) }
        let boundary = String(format: "------------------------%08X%08X", makeRandom(), makeRandom())

        let contentType: String = try {
            guard let charset = CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(encoding.rawValue)) else {
                throw MultipartFormDataEncodingError.characterSetName
            }
            return "multipart/form-data; charset=\(charset); boundary=\(boundary)"
        }()
        addValue(contentType, forHTTPHeaderField: "Content-Type")

        httpBody = try {
            var body = Data()

            for (rawName, rawValue) in parameters {
                if !body.isEmpty {
                    body.append("\r\n".data(using: .utf8)!)
                }

                body.append("--\(boundary)\r\n".data(using: .utf8)!)

                guard
                    rawName.canBeConverted(to: encoding),
                    let disposition = "Content-Disposition: form-data; name=\"\(rawName)\"\r\n".data(using: encoding) else {
                    throw MultipartFormDataEncodingError.name(rawName)
                }
                body.append(disposition)

                body.append("\r\n".data(using: .utf8)!)

                guard let value = rawValue.data(using: encoding) else {
                    throw MultipartFormDataEncodingError.value(rawValue, name: rawName)
                }

                body.append(value)
            }

            body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

            return body
        }()
    }
}

public enum MultipartFormDataEncodingError: Error {
    case characterSetName
    case name(String)
    case value(String, name: String)
}

struct LoginItem : Codable {
    var name : String
    var token : String
    var tenant : String
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case token = "Token"
        case tenant = "Tenant"
    }
}
