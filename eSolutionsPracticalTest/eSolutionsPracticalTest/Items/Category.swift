//
//  Category.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-02.
//


import Foundation

typealias Categories = [CategoryElement]
struct CategoryElement:Decodable, Hashable {
    struct Image:Decodable,Hashable {
        let url, title: String
        let source: String
    }
    private enum CodingKeys : String, CodingKey {
        case categoryID = "category_id", shortName = "short_name", fullName = "full_name", orderableCount = "orderable_count",url = "url", parentID = "parent_id", unavailableCount = "unavailable_count", featured = "featured", popularity = "popularity", images = "images"
    }
    

    let categoryID, unavailableCount, parentID:String
    let shortName, fullName, orderableCount, url, featured: String
    let popularity: String
    let images: [Image]?

//MARK: Hashable
    static func == (lhs: CategoryElement, rhs: CategoryElement) -> Bool {
        return lhs.categoryID == rhs.categoryID
    }
}
