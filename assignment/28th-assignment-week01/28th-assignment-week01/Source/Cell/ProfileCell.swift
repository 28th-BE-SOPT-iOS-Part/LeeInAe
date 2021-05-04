//
//  ProfileCell.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/23.
//

import UIKit

class ProfileCell: UITableViewCell {
    static let identifier = "ProfileCell"

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func initCell(user: UserDataModel) {
        profileImage.image = user.image

        userNameLabel.text = user.name
        userNameLabel.font = UIFont.AppleSDGothic(type: .semiBold, size: 16)
        userNameLabel.textColor = UIColor.black

        stateLabel.text = user.state
        stateLabel.font = UIFont.AppleSDGothic(type: .regular, size: 11)
        stateLabel.textColor = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
    }
}
