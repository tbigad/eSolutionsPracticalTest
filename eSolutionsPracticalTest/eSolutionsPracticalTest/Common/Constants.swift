//
//  Constants.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-02.
//

import Foundation

let constants = Constants()

struct Constants {
    let xApiKey:String = "8e0b3d60f5807f776ec7689f4110fc9fc9484ddc98b49adfd38eeec0e5d5f62d7e345c6d3cd78eafd9db77eadbdf9c5e704c660d58c1a1c66a8eb1b2dff0223c"
    var baseUrl:URL {
        get {
            return URL(string: "https://www.opticsplanet.com/")!
        }
    }
    
    var categoriesPath: String {
        get {
            return "api/0.2/categories"
        }
    }
}
