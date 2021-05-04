//
//  UIFont+Extension.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/05/05.
//

import UIKit

extension UIFont {
    class func AppleSDGothic(type: AppleSDGothicType, size: CGFloat) -> UIFont! {
        guard let font = UIFont(name: type.name, size: size) else {
            return nil
        }
        return font
    }

    public enum AppleSDGothicType {
        case semiBold
        case regular

        var name: String {
            switch self {
            case .regular:
                return "AppleSDGothicNeo-Regular"
            case .semiBold:
                return "AppleSDGothicNeo-SemiBold"
            }
        }
    }
}
