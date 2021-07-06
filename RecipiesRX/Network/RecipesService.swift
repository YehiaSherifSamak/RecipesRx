//
//  RecipesService.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 06/07/2021.
//

import Foundation
import Moya
import RxSwift

class RecipesService{
    private let provider = MoyaProvider<RecipeRoute>()
    let globalSchedular = ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global())
    func getRecipes()->Observable<[Recipe]>{
        return provider
            .rx
            .request(.getRecipes)
            .subscribeOn(globalSchedular)
            .asObservable()
            .observeOn(MainScheduler.instance)
            .share()
            .compactMap { response ->[Recipe] in
                do{
                    let result = try JSONDecoder().decode(RecipesResult.self, from: response.data)
                    return result.recipes
                }catch let error{
                    throw error
                }
            }
    }
    
}
