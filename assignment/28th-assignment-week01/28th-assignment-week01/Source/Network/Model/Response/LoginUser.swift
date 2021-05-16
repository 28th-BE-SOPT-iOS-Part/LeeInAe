//
//  LoginUser.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/05/16.
//

import Foundation

struct LoginUser: Codable {
    var id: Int
    var nickname: String
    var token: String

    enum CodingKeys: String, CodingKey {
        case id = "UserId"
        case nickname = "user_nickname"
        case token
    }
}
