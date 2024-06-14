//
//  InstructionsView.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/14/24.
//

import SwiftUI

// Displays the instructions for the current meal
struct InstructionsView: View {
    var detailedInstructions: String
    var modelObject: MealDetailedViewModel
    var body: some View {
        List{
            Text(detailedInstructions)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .listStyle(PlainListStyle())
    }
}


#Preview {
    InstructionsView(detailedInstructions: "", modelObject: MealDetailedViewModel())
}
