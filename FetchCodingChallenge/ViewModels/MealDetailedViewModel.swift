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
    @Published var measures:[String] = []
    
    // Fetching all the details of a meal using its mealId
    func getMealDetails(forMealId mealId:String) async throws -> MealDetailedView {
        let endpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)"
        
        guard let url = URL(string: endpoint) else {
            
            print("error in \(endpoint)")
            throw APIErrors.errorInURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        //Checking if response is OK
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("erros in \(response)")
            throw APIErrors.errorInResponse
        }
        
        //Decoding the JSON to store it in the form of resepctive model
        do{
            
            let decoder = JSONDecoder()
            let moddedResponse = try decoder.decode(DetailedMeal.self, from: data)
            detailedMeal = moddedResponse.meals
            prepareTheIngredientsAndMeasuresList() //Filtering nil values for the ingredients and measures
            return detailedMeal[0]
            
        }catch{
            print("error in decoding")
            throw APIErrors.errorInData
        }
    }
    

    // Working with optionals and storing the values if provided otherwise empty string is added to the list
    func prepareTheIngredientsAndMeasuresList(){
        
        ingredients = [
            detailedMeal[0].strIngredient1,
            detailedMeal[0].strIngredient2,
            detailedMeal[0].strIngredient3,
            detailedMeal[0].strIngredient4,
            detailedMeal[0].strIngredient5,
            detailedMeal[0].strIngredient6,
            detailedMeal[0].strIngredient7,
            detailedMeal[0].strIngredient8,
            detailedMeal[0].strIngredient9,
            detailedMeal[0].strIngredient10,
            detailedMeal[0].strIngredient11,
            detailedMeal[0].strIngredient12,
            detailedMeal[0].strIngredient13,
            detailedMeal[0].strIngredient14,
            detailedMeal[0].strIngredient15,
            detailedMeal[0].strIngredient16,
            detailedMeal[0].strIngredient17,
            detailedMeal[0].strIngredient18,
            detailedMeal[0].strIngredient19,
            detailedMeal[0].strIngredient20,
        ].compactMap{ $0 }
        
        measures = [
            detailedMeal[0].strMeasure1,
            detailedMeal[0].strMeasure2,
            detailedMeal[0].strMeasure3,
            detailedMeal[0].strMeasure4,
            detailedMeal[0].strMeasure5,
            detailedMeal[0].strMeasure6,
            detailedMeal[0].strMeasure7,
            detailedMeal[0].strMeasure8,
            detailedMeal[0].strMeasure9,
            detailedMeal[0].strMeasure10,
            detailedMeal[0].strMeasure11,
            detailedMeal[0].strMeasure12,
            detailedMeal[0].strMeasure13,
            detailedMeal[0].strMeasure14,
            detailedMeal[0].strMeasure15,
            detailedMeal[0].strMeasure16,
            detailedMeal[0].strMeasure17,
            detailedMeal[0].strMeasure18,
            detailedMeal[0].strMeasure19,
            detailedMeal[0].strMeasure20,
        ].compactMap{ $0 }

    }
    
}
