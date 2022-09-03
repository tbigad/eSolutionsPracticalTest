//
//  ListOfProducts.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import Foundation

typealias ListOfProducts = [ListOfProductsOutput.ProductElementOutput]

struct ListOfProductsOutput : Decodable {
    enum ListOfProductsOutputKeys : String, CodingKey {
        case gridProducts = "gridProducts"
    }
    let gridProducts: Elements
    
    struct Elements:Decodable {
        let elements: [ProductElementOutput]
    }
    
    struct ProductElementOutput : Decodable {
        let shortName, fullName, url,primaryImage, brandName: String
        let price: Double
        
        enum ProductElementOutput : String, CodingKey {
            case shortName = "short_name", fullName = "full_name", primaryImage = "primary_image", brandName = "brand_name", url = "url", price = "price"
        }
        
        init(from decoder: Decoder) throws {
            let decoder = try decoder.container(keyedBy: ProductElementOutput.self)
            self.shortName = try decoder.decode(String.self, forKey: .shortName)
            self.fullName = try decoder.decode(String.self, forKey: .fullName)
            self.url = try decoder.decode(String.self, forKey: .url)
            self.primaryImage = try decoder.decode(String.self, forKey: .primaryImage)
            self.brandName = try decoder.decode(String.self, forKey: .brandName)
            self.price = try decoder.decode(Double.self, forKey: .price)
        }
    }
}
