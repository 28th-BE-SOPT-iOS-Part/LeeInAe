//
//  ProfileCell.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/23.
//

import UIKit

class ProfileCell: UITableViewCell {
    static let identifier = "ProfileCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func touchUpProfile(_ sender: Any) {
        print("프로필 누름")
    }
}
