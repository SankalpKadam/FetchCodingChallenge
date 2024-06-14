//
//  MealListItemViewModel.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/12/24.
//

import Foundation

final class MealListItemViewModel : ObservableObject {
    
    @Published var mealListItems : [MealListItem] = []
    
    // This function makes a request to the API endpoint and stores fills the mealListItems array with the response received from the API
    func getMeals() async throws{
        let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: endpoint) else {
            throw APIErrors.errorInURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        // Checking if response is Ok
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIErrors.errorInResponse
        }
        // Deconding to store the JSON response in the form of respective model
        do{
            let decoder = JSONDecoder()
            let moddedResponse = try decoder.decode(Meals.self, from:data)
            mealListItems = moddedResponse.meals.sorted{$0.strMeal < $1.strMeal} // sorts the meals in alphabetical order
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
