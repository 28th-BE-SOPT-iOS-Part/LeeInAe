//
//  LoginVC.swift
//  28th-seminar-week04
//
//  Created by inae Lee on 2021/05/08.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.idTextField.autocorrectionType = .no
        self.passwordTextField.autocorrectionType = .no
        
        self.makeAlert(title: "알림", message: "로그인 성공")
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        self.makeRequestAlert(title: "알림",
                              message: "로그인을 하시겠습니까?",
                              okAction: { _ in
                                  self.loginAction()
                              })
    }
    
    func loginAction() {
        LoginService.shared.login(email: self.idTextField.text!, password: self.passwordTextField.text!) { result in
            switch result {
            case .success(let message):
                
                if let message = message as? String {
                    self.makeAlert(title: "알림",
                                   message: message)
                }
                
            case .requestErr(let message):
                
                if let message = message as? String {
                    self.makeAlert(title: "알림",
                                   message: message)
                }
                           
            default:
                print("ERROR")
            }
        }
    }
}
