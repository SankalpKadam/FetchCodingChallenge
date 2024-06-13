//
//  MealListItem.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/12/24.
//

import Foundation

struct MealListItem: Identifiable, Codable{
    
    var id:String {idMeal}
    let idMeal: String
    let strMeal: String
    let strMealThumb:String
    
}
struct Meals: Codable {
    let meals: [MealListItem]
}
