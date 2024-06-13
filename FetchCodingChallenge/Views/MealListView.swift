//
//  MealList.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/12/24.
//

import SwiftUI

struct MealList: View {
    var body: some View {
        NavigationView {
            List(0..<10){
                item in
                MealListItem()
                    .listRowSeparator(.hidden)
            }
            .navigationTitle("Desserts")
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .listStyle(PlainListStyle())
            
        }
        
    }
}

#Preview {
    MealList()
}
