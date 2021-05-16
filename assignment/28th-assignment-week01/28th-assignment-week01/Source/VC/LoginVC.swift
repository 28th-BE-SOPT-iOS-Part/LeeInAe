//
//  ViewController.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/05.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    override func viewWillAppear(_ animated: Bool) {
        emailTextField.text = .none
        passwordTextField.text = .none
    }

    func initView() {
        emailTextField.clearButtonMode = .always
        passwordTextField.clearButtonMode = .always

        emailTextField.autocorrectionType = .no
        passwordTextField.autocorrectionType = .no

        emailTextField.setUnderline(color: CGColor(red: 130/255, green: 130/155, blue: 130/255, alpha: 1), borderSize: 1)
        passwordTextField.setUnderline(color: CGColor(red: 130/255, green: 130/155, blue: 130/255, alpha: 1), borderSize: 1)
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func touchUpLoginButton(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)

        LoginService.shared.signIn(user: SignModel(email: email, password: password)) { response in

            switch response {
            case .success(let resData):
                guard let data = resData as? NetworkResponse<SignInUser> else { return }
                let action = UIAlertAction(title: "확인", style: .cancel) { _ in
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

    @IBAction func touchUpSignUpButton(_ sender: Any) {
        guard let signUpVC = storyboard?.instantiateViewController(identifier: "SignUpVC") as? SignUpVC else { return }

        navigationController?.pushViewController(signUpVC, animated: true)
    }

    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {
        _ = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
}

extension UITextField {}
