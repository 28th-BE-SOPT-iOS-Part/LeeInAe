//
//  LoginResponse.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/05/14.
//

import Foundation

struct NetworkResponse<T: Codable>: Codable {
    let success: Bool
    let message: String
    let data: T?

    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
    }
}
