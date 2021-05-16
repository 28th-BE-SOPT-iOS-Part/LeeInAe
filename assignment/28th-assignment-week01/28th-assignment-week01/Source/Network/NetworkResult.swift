//
//  NetworkResult.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/05/14.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
