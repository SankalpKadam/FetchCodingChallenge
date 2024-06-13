//
//  ContentView.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/11/24.
//



// Entry point view for the iOS App
import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
//            MealDetailedView()
            MealListView()
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MainView()
}
