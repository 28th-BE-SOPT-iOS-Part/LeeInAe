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

        emailTextField.setUnderline(color: CGColor(red: 130/255, green: 130/155, blue: 130/255, alpha: 1), borderSize: 1)
        passwordTextField.setUnderline(color: CGColor(red: 130/255, green: 130/155, blue: 130/255, alpha: 1), borderSize: 1)
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func touchUpLoginButton(_ sender: Any) {
        guard let confirmVC = storyboard?.instantiateViewController(identifier: "ConfirmVC") as? ConfirmVC else { return }

        confirmVC.name = emailTextField.text
        confirmVC.modalPresentationStyle = .fullScreen

        present(confirmVC, animated: true, completion: nil)
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
