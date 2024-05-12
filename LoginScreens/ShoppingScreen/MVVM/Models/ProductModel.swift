//
//  ProductModel.swift
//  LoginScreens
//
//  Created by Ahir on 02/03/24.
//

import Foundation
struct ProductModel: Codable {
    var response: [Categories]
    
    //    enum CodingKeys: String, CodingKey {
    //        case response
    //    }
}
struct Products: Codable {
    var name: String
    var imageName: String
    var price: String
    var description: String
    
    //        enum CodingKeys: String, CodingKey {
    //            case name
    //            case imageName = "image_name"
    //            case price
    //            case description
    //        }
}
struct Categories: Codable {
    var categoryName: String
    var products: [Products]
    
    //        enum CodingKeys: String, CodingKey {
    //            case categoryName = "category_name"
    //            case products
    //        }
}
