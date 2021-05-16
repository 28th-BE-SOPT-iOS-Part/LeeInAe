//
//  LoginService.swift
//  28th-assignment-week01
//
//  Created by inae Lee on 2021/05/16.
//

import Alamofire
import Foundation

struct LoginService {
    static let shared = LoginService()

    private func makeParameter(user: SignModel) -> Parameters {
        ["email": user.email, "password": user.password]
    }

    func signIn(user: SignModel, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(APIConstants.signInURL, method: .post, parameters: makeParameter(user: user), encoding: JSONEncoding.default, headers: header)

        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                let networkResult = judgeStatus(by: statusCode, value)

                completion(networkResult)
            case .failure:
                completion(.pathErr)
            }
        }
    }

    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(NetworkResponse<LoginUser>.self, from: data) else { return .pathErr }

        switch statusCode {
        case 200:
            return .success(decodedData)
        case 400:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
