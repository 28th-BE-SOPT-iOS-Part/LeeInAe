//
//  ViewController.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    func initView() {
        emailTextField.setUnderline(color: CGColor(red: 130/255, green: 130/155, blue: 130/255, alpha: 1), borderSize: 2)
        passwordTextField.setUnderline(color: CGColor(red: 130/255, green: 130/155, blue: 130/255, alpha: 1), borderSize: 2)
    }
}
