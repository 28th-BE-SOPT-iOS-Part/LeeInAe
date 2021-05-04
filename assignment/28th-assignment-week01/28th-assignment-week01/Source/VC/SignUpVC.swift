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
        passwordTextField.clearButtonMode = .always
        passwordConfirmTextField.clearButtonMode = .always

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

        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        guard let tabBarVC = storyboard.instantiateViewController(identifier: TabBarVC.identifier) as? TabBarVC else { return }

        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true, completion: nil)
    }
}
