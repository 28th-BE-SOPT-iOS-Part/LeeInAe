//
//  SignUpVC.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/05.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordConfirmTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    func initView() {
        emailTextField.text = .none
        passwordTextField.text = .none
        passwordConfirmTextField.text = .none

        emailTextField.clearButtonMode = .always
        emailTextField.autocorrectionType = .no

        passwordTextField.clearButtonMode = .always
        passwordTextField.autocorrectionType = .no

        passwordConfirmTextField.clearButtonMode = .always
        passwordConfirmTextField.autocorrectionType = .no

        emailTextField.setUnderline(color: CGColor(gray: 1, alpha: 1), borderSize: 1)
        passwordTextField.setUnderline(color: CGColor(gray: 1, alpha: 1), borderSize: 1)
        passwordConfirmTextField.setUnderline(color: CGColor(gray: 1, alpha: 1), borderSize: 1)

        passwordTextField.isSecureTextEntry = true
        passwordConfirmTextField.isSecureTextEntry = true
    }

    @IBAction func touchUpSignUpButton(_ sender: Any) {
        if emailTextField.text?.count == 0 || passwordTextField.text?.count == 0 ||
            passwordConfirmTextField.text?.count == 0
        {
            return
        }

        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)

        LoginService.shared.signUp(user: SignModel(email: email, password: password)) { response in

            switch response {
            case .success(let resData):
                guard let data = resData as? NetworkResponse<SignUpUser> else { return }
                let action = UIAlertAction(title: "확인", style: .default) { _ in
                    let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
                    guard let tabBarVC = storyboard.instantiateViewController(identifier: TabBarVC.identifier) as? TabBarVC else { return }

                    tabBarVC.modalPresentationStyle = .fullScreen
                    self.present(tabBarVC, animated: true, completion: nil)
                }

                alert.message = data.message
                alert.addAction(action)

                self.present(alert, animated: true, completion: nil)
            case .requestErr(let msg):
                let action = UIAlertAction(title: "확인", style: .cancel)
                alert.message = msg as? String
                alert.addAction(action)

                self.present(alert, animated: true, completion: nil)
            case .pathErr: break
            case .serverErr: break
            case .networkFail: break
            }
        }
    }
}
