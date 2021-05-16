//
//  APIConstants.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/05/16.
//

import Foundation

struct APIConstants {
    // MARK: - baseURL

    static let baseURL = "http://cherishserver.com"

    // MARK: - Auth URL

    static let signInURL = baseURL + "/login/signin"
    static let signUpURL = baseURL + "/login/signup"
}
