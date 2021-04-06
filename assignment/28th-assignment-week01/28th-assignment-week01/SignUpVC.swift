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
        guard let confirmVC = storyboard?.instantiateViewController(identifier: "ConfirmVC") as? ConfirmVC else { return }
        confirmVC.name = emailTextField.text
        confirmVC.modalPresentationStyle = .fullScreen

        present(confirmVC, animated: true, completion: nil)
    }
}
