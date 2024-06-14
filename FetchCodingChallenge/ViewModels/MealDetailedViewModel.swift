//
//  MealDetailedViewModel.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/13/24.
//

import Foundation

final class MealDetailedViewModel: ObservableObject {
    @Published var detailedMeal:[MealDetailedView] = []
    @Published var ingredients:[String] = []
    func getMealDetails(forMealId mealId:String) async throws -> MealDetailedView {
        let endpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)"
        
        guard let url = URL(string: endpoint) else {
            
            print("error \(endpoint)")
            throw APIErrors.errorInURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("gerror")
            throw APIErrors.errorInResponse
        }
        
        do{
            
            let decoder = JSONDecoder()
            let moddedResponse = try decoder.decode(DetailedMeal.self, from: data)
            detailedMeal = moddedResponse.meals
            return detailedMeal[0]
//            checkIfPropertyExists(moddedResponse:moddedResponse.meals[0])
        }catch{
            print("error here?")
            throw APIErrors.errorInData
        }
    }
    
    func checkIfExists (){
        
    }
    
    func prepareTheIngredientsList() -> [String]{
        ingredients.append(detailedMeal[0].strIngredient1 ?? "")
        ingredients.append(detailedMeal[0].strIngredient2 ?? "")
        ingredients.append(detailedMeal[0].strIngredient3 ?? "")
        ingredients.append(detailedMeal[0].strIngredient4 ?? "")
        ingredients.append(detailedMeal[0].strIngredient5 ?? "")
        ingredients.append(detailedMeal[0].strIngredient6 ?? "")
        ingredients.append(detailedMeal[0].strIngredient7 ?? "")
        ingredients.append(detailedMeal[0].strIngredient8 ?? "")
        ingredients.append(detailedMeal[0].strIngredient9 ?? "")
        ingredients.append(detailedMeal[0].strIngredient10 ?? "")
        ingredients.append(detailedMeal[0].strIngredient11 ?? "")
        ingredients.append(detailedMeal[0].strIngredient12 ?? "")
        ingredients.append(detailedMeal[0].strIngredient13 ?? "")
        ingredients.append(detailedMeal[0].strIngredient14 ?? "")
        ingredients.append(detailedMeal[0].strIngredient15 ?? "")
        ingredients.append(detailedMeal[0].strIngredient16 ?? "")
        ingredients.append(detailedMeal[0].strIngredient17 ?? "")
        ingredients.append(detailedMeal[0].strIngredient18 ?? "")
        ingredients.append(detailedMeal[0].strIngredient19 ?? "")
        ingredients.append(detailedMeal[0].strIngredient20 ?? "")
        return ingredients
    }
    
}
