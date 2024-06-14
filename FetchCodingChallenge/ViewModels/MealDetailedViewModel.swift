//
//  MealDetailedViewModel.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/13/24.
//

import Foundation

final class MealDetailedViewModel: ObservableObject {
    @Published var detailedMealArray:[MealDetailedView] = [] //Using an array since tha JSON returned contains an array of single object
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
            detailedMealArray = moddedResponse.meals
            prepareTheIngredientsAndMeasuresList() //Filtering nil values for the ingredients and measures
            return detailedMealArray[0]
            
        }catch{
            print("error in decoding")
            throw APIErrors.errorInData
        }
    }
    

    // Helper function to work with optionals and storing the values if provided otherwise empty string is added to the list
    func prepareTheIngredientsAndMeasuresList(){
        
        ingredients = [
            detailedMealArray[0].strIngredient1,
            detailedMealArray[0].strIngredient2,
            detailedMealArray[0].strIngredient3,
            detailedMealArray[0].strIngredient4,
            detailedMealArray[0].strIngredient5,
            detailedMealArray[0].strIngredient6,
            detailedMealArray[0].strIngredient7,
            detailedMealArray[0].strIngredient8,
            detailedMealArray[0].strIngredient9,
            detailedMealArray[0].strIngredient10,
            detailedMealArray[0].strIngredient11,
            detailedMealArray[0].strIngredient12,
            detailedMealArray[0].strIngredient13,
            detailedMealArray[0].strIngredient14,
            detailedMealArray[0].strIngredient15,
            detailedMealArray[0].strIngredient16,
            detailedMealArray[0].strIngredient17,
            detailedMealArray[0].strIngredient18,
            detailedMealArray[0].strIngredient19,
            detailedMealArray[0].strIngredient20,
        ].compactMap{ $0 }
        
        measures = [
            detailedMealArray[0].strMeasure1,
            detailedMealArray[0].strMeasure2,
            detailedMealArray[0].strMeasure3,
            detailedMealArray[0].strMeasure4,
            detailedMealArray[0].strMeasure5,
            detailedMealArray[0].strMeasure6,
            detailedMealArray[0].strMeasure7,
            detailedMealArray[0].strMeasure8,
            detailedMealArray[0].strMeasure9,
            detailedMealArray[0].strMeasure10,
            detailedMealArray[0].strMeasure11,
            detailedMealArray[0].strMeasure12,
            detailedMealArray[0].strMeasure13,
            detailedMealArray[0].strMeasure14,
            detailedMealArray[0].strMeasure15,
            detailedMealArray[0].strMeasure16,
            detailedMealArray[0].strMeasure17,
            detailedMealArray[0].strMeasure18,
            detailedMealArray[0].strMeasure19,
            detailedMealArray[0].strMeasure20,
        ].compactMap{ $0 }

    }
    
}
