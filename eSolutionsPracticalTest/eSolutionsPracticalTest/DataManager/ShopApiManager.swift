//
//  NetworkHelper.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-02.
//

import Foundation

final class ShopApiManager {
    private let xApiKey:String
    private let baseUrl:URL
    init(xApiKey:String, baseUrl:URL) {
        self.xApiKey = xApiKey
        self.baseUrl = baseUrl
    }
    enum NetworkHelperError:Error {
        case undefine
    }
    
    func getCategories(complition:@escaping (Result<Categories,Error>)->()) {
        let session = URLSession.shared
        
        guard let url = URL(string: constants.categoriesPath, relativeTo: baseUrl) else {return}
        var request = URLRequest(url: url)
        request.addValue(xApiKey, forHTTPHeaderField: "x-apikey")
        
        session.dataTask(with: request) { data, responce, error in
            if let error = error {
                complition(.failure(error))
                return
            } else if let data = data {
                do {
                    let decodeData = try JSONDecoder().decode(Categories.self, from: data)
                    complition(.success(decodeData))
                } catch(let error) {
                    complition(.failure(error))
                }
                return
            }
            complition(.failure(NetworkHelperError.undefine))
        }.resume()
    }
}
