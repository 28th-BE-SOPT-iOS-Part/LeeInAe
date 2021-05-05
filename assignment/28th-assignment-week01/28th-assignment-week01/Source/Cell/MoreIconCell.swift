//
//  MoreIconCell.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/05/06.
//

import UIKit

class MoreIconCell: UICollectionViewCell {
    static let identifier = "MoreIconCell"

    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var iconNameLabel: UILabel!

    func initCell(iconName: String) {
        iconImage.image = UIImage(named: "messageTabIcon")
        iconNameLabel.text = iconName
        iconNameLabel.font = UIFont.AppleSDGothic(type: .regular, size: 11)
    }
}
