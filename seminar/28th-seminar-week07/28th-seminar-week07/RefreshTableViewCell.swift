//
//  RefreshTableViewCell.swift
//  28th-seminar-week07
//
//  Created by inae Lee on 2021/05/29.
//

import UIKit

class RefreshTableViewCell: UITableViewCell {
    static let identifier: String = "RefreshTableViewCell"

    @IBOutlet var sampleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(data: String) {
        sampleLabel.text = data
    }
}
