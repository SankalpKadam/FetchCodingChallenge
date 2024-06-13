//
//  MealList.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/12/24.
//

import SwiftUI

struct MealListView: View {
    @StateObject var mealListItemViewModel = MealListItemViewModel()
    
    var body: some View {
        NavigationView {
            List(mealListItemViewModel.mealListItems, id: \.id){
                item in
                NavigationLink(destination: MealDetailedItemView(mealId: item.idMeal), label: {MealListItemView(item: item)})
                    .listRowSeparator(.hidden)
            }
            .navigationTitle("Desserts")
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .listStyle(PlainListStyle())
            
        }
        .task {
            do {
                try await mealListItemViewModel.getMeals()
            }catch {
                print("new error")
            }
        }
        
    }
}

#Preview {
    MealListView()
}
