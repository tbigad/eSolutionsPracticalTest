//
//  Product.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-04.
//

import Foundation

struct ProductItem : Decodable{
    let price:Double
    let description:String
    let image:String
    let title:String
    enum ProductItemKodingKeys : String, CodingKey {
        case price = "min_sale_price", description="description", image = "primary_image", title = "full_name"
    }
    init(from decoder: Decoder) throws {
        let decoder = try decoder.container(keyedBy: ProductItemKodingKeys.self)
        self.price = try decoder.decode(Double.self, forKey: .price)
        self.description = try decoder.decode(String.self, forKey: .description)
        self.image = try decoder.decode(String.self, forKey: .image)
        self.title = try decoder.decode(String.self, forKey: .title)
    }
}
