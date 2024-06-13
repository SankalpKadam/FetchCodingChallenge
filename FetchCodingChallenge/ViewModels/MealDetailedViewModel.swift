//
//  MealDetailedViewModel.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/13/24.
//

import Foundation

final class MealDetailedViewModel: ObservableObject {
    @Published var detailedMeal:[MealDetailedView] = []
    func getMealDetails(forMealId mealId:String) async throws {
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
            print(detailedMeal[0])
            return
//            checkIfPropertyExists(moddedResponse:moddedResponse.meals[0])
        }catch{
            print("error here?")
            throw APIErrors.errorInData
        }
    }
    
    func checkIfExists (){
        guard let value = detailedMeal[0].strMeasure17 else {
            print("No measure 17")
            return
        }
        print(value)
    }
    
}
