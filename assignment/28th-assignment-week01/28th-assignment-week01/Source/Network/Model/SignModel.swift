//
//  SignModel.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/05/16.
//

import Foundation

struct SignModel: Codable {
    var email: String
    var password: String
    var sex: String?
    var nickname: String?
    var phone: String?
    var birth: String?
}
