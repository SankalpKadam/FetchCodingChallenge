//
//  MealDetailedView.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/13/24.
//

import SwiftUI

struct MealDetailedItemView: View {
    var mealId: String // storing the meal Id from list view
    @StateObject var detailedViewModel: MealDetailedViewModel = MealDetailedViewModel() // Using the detailed view model to fetch the data necessary
    
    @State private var detailMeal: MealDetailedView = MealDetailedView(idMeal: "53049") // This variable stores the fetched response
    var body: some View {
        NavigationView {
            
            MealDetailedCardView(mealDetails: detailMeal, modelObject: detailedViewModel)
            
        }
        .task {
            do{
                detailMeal = try await detailedViewModel.getMealDetails(forMealId: mealId) //Fetches the specific meal
                
            }catch {
                print("some error")
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding(.horizontal)
    }
}

#Preview {
    MealDetailedItemView(mealId: "53049")
}



