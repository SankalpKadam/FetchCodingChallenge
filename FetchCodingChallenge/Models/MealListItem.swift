//
//  MealListItem.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/12/24.
//

import Foundation

// Struct to store the properties of each meal
struct MealListItem: Identifiable, Codable{
    
    var id:String {idMeal}
    let idMeal: String
    let strMeal: String
    let strMealThumb:String
    
}

// Struct to decode the meals list from the API
struct Meals: Codable {
    
    let meals: [MealListItem]
}
