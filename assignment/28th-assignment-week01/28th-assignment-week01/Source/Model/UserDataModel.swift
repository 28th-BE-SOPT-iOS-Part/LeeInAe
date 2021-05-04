//
//  FriendDataModel.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/05/05.
//

import UIKit

struct UserDataModel {
    var image: UIImage
    var name: String
    var state: String

    init(imageName: String,
         name: String,
         state: String)
    {
        if let image = UIImage(named: imageName) {
            self.image = image
        }
        else {
            self.image = UIImage()
        }
        self.name = name
        self.state = state
    }
}
