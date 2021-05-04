//
//  UITextField+Extension.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/04/05.
//

import Foundation
import UIKit

extension UITextField {
    func setUnderline(color: CGColor, borderSize: CGFloat) {
        self.borderStyle = .none

        let border = CALayer() // 뭐냐
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: self.bounds.size.height - borderSize, width: self.bounds.width, height: self.bounds.height)
        border.borderWidth = borderSize

        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
