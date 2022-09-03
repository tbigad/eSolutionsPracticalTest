//
//  NetworkHelper.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-02.
//

import Foundation

final class NetworkHelper {
    enum NetworkHelperError:Error {}
    
    static func getCategories(complition:@escaping (Result<Categories,Error>)->()) {
        let session = URLSession.shared
        
        guard let url = URL(string: constants.categoriesPath, relativeTo: constants.baseUrl) else {return}
        var request = URLRequest(url: url)
        request.addValue(constants.xApiKey, forHTTPHeaderField: "x-apikey")
        
        session.dataTask(with: request) { data, responce, error in
            
        }.resume()
    }
}
