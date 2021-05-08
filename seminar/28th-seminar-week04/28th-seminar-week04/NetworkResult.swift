//
//  NetworkResult.swift
//  28th-seminar-week04
//
//  Created by inae Lee on 2021/05/08.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
