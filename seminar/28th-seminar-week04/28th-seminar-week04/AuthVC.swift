//
//  AuthVC.swift
//  28th-seminar-week04
//
//  Created by inae Lee on 2021/05/08.
//

import UIKit

class AuthVC: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.sizeToFit()
        messageLabel.sizeToFit()
    }

    @IBAction func getButtonClicked(_ sender: Any) {
        GetPersonDataService.shared.getPersonInfo { response in
            switch response {
                case .success(let personData):
                    if let data = personData as? Person {
                        self.nameLabel.text = data.name
                        self.messageLabel.text = data.profileMessage
                    }
                case .requestErr(let message):
                    print("requestERR", message)
                case .pathErr:
                    print("pathERR")
                case .serverErr:
                    print("serverERR")
                case .networkFail:
                    print("networkFail")
            }
        }
    }
}
