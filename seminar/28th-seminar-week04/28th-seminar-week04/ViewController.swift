//
//  ViewController.swift
//  28th-seminar-week04
//
//  Created by inae Lee on 2021/05/08.
//

import UIKit

struct PersonDataModel: Encodable {
    var name: String
    var age: Int
}

struct CoffeeDataModel: Decodable {
    var drink: String
    var price: Int
    var orderer: String

    enum CodingKeys: String, CodingKey {
        case drink
        case price = "coffe_price"
        case orderer
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        drink = (try? values.decode(String.self, forKey: .drink)) ?? ""
        price = (try? values.decode(Int.self, forKey: .price)) ?? 0
        orderer = (try? values.decode(String.self, forKey: .orderer)) ?? ""
    }
}

class ViewController: UIViewController {
    let personData = PersonDataModel(name: "이인애", age: 25)
    let dummyData = """
    {
                  "drink" : "아메리카노",
                  "coffe_price" : 2000,
                  "orderer" : "JH"
    }
    """.data(using: .utf8)!

    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted

        let jsonDecoder = JSONDecoder()

        do {
            let json = try jsonEncoder.encode(personData)
            print(String(data: json, encoding: .utf8)!)
            
        } catch {
            print(error)
        }

        do {
            let order = try jsonDecoder.decode(CoffeeDataModel.self, from: dummyData)
            print("성공")
            dump(order)
            dump(order.price)
        } catch {
            print(error)
        }
    }
}

