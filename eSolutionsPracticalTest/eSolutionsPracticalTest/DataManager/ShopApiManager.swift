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
        
        guard let url = URL(string: constants.categoriesPath, relativeTo: baseUrl) else {
            complition(.failure(NetworkHelperError.undefine))
            return
        }
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
    
    func getListOfProducts(category:String,page:Int,complition:@escaping (Result<ListOfProductsOutput,Error>)->()) {
        let session = URLSession.shared
        let listOfProductsFullPath = String(format: "/%@/%@/products", constants.listOfProductsPath,category)
        
        let urlQueryItems = [URLQueryItem(name: "_iv_page", value: String(page)),URLQueryItem(name: "_iv_gridSize", value: String(20))]
        
        var urlComponents = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = urlQueryItems
        urlComponents?.path = listOfProductsFullPath
        guard let url = urlComponents?.url else {
            complition(.failure(NetworkHelperError.undefine))
            return
        }
        var request = URLRequest(url: url)
        request.addValue(xApiKey, forHTTPHeaderField: "x-apikey")
        session.dataTask(with: request) { data, responce, error in
            if let error = error {
                complition(.failure(error))
                return
            } else if let data = data {
                do {
                    let decodeData = try JSONDecoder().decode(ListOfProductsOutput.self, from: data)
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
