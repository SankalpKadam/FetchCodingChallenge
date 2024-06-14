//
//  IngredientsView.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/14/24.
//

import SwiftUI

// Displays the list of ingredients in a seperate page
struct IngredientsView:View {
    
    var detailedMeal: MealDetailedView
    var modelObject: MealDetailedViewModel
    
    var body: some View {
        
        // The following only renders the items that have some value and thus handles the nil values of properties
        List (Array(zip(modelObject.ingredients, modelObject.measures)), id: \.0.self) {
            
            item in if !item.0.isEmpty && !item.1.isEmpty{
                HStack {
                    Text(item.1)
                    Spacer()
                    Text(item.0)
                }
            }
            
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    IngredientsView(detailedMeal: MealDetailedView(idMeal: "1"), modelObject: MealDetailedViewModel())
}
