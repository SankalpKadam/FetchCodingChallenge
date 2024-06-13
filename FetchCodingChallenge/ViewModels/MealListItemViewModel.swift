//
//  MealListItemViewModel.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/12/24.
//

import Foundation

final class MealListItemViewModel : ObservableObject {
    
    @Published var mealListItems : [MealListItem] = []
    
    func getMeals() async throws{
        let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: endpoint) else {
            throw APIErrors.errorInURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIErrors.errorInResponse
        }
        do{
            let decoder = JSONDecoder()
            let moddedResponse = try decoder.decode(Meals.self, from:data)
            mealListItems = moddedResponse.meals
        }catch {
            throw APIErrors.errorInData
        }
        
    }
    
}

enum APIErrors: Error{
    case errorInURL
    case errorInResponse
    case errorInData
}
