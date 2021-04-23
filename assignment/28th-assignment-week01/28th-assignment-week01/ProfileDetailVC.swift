//
//  ProfileDetailVC.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/23.
//

import UIKit

class ProfileDetailVC: UIViewController {
    static let identifier = "ProfileDetailVC"

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var buttonHStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    // MARK: - IBActions

    @IBAction func touchUpCloseBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Custom Methods

extension ProfileDetailVC {
    func initView() {
        view.backgroundColor = UIColor(red: 159/255, green: 167/255, blue: 173/255, alpha: 1)

        profileImage.image = UIImage(named: "friendtabProfileImg")

        nameLabel.text = "이인애"
        nameLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        nameLabel.textColor = .white
    }
}
