//
//  RecipesService.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 06/07/2021.
//

import Foundation
import Moya


enum RecipesRequest{
    case getRecipes
}
extension RecipesRequest: TargetType{
    var baseURL: URL {
        return URL(string: "https://api.edamam.com/")!
    }
    
    var path: String {
        return "search"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        let appID: String = "0c99a4fb"
        let appKey: String = "91b270961ff00601ec96eb20a51aec3d"
        let query: String = "Chicken"
        let paramters =  ["q": query, "app_id" : appID, "app_key" : appKey, "from" : String(0)]
        return .requestParameters(parameters: paramters, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
