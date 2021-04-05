//
//  ConfirmVC.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/05.
//

import UIKit

class ConfirmVC: UIViewController {
    var name: String?
    
    @IBOutlet var confirmButton: UIButton!
    @IBOutlet var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    func initView() {
        titleLabel.numberOfLines = 0
        titleLabel.text = "\(name)님\n환영합니다"
        titleLabel.sizeToFit()
        
        confirmButton.titleLabel?.text = "확인"
        confirmButton.backgroundColor = UIColor(red: 255/255, green: 232/255, blue: 18/255, alpha: 1)
    }
}
