//
//  MealDetailedView.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/13/24.
//

import SwiftUI

struct MealDetailedItemView: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string:"https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg"), content : {image in
                image.resizable()
                    .scaledToFit()
                    .frame(height:UIScreen.main.bounds.height/2)
                    .cornerRadius(4)
                
            },placeholder: {
                Image("placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(4)
                    .opacity(0.4)
            })
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                List {
                    HStack{
                        Text("Category")
                        Spacer()
                        Text("Dessert")
                            .fontWeight(.semibold)
                        
                    }
                    HStack{
                        Text("Area")
                        Spacer()
                        Text("British")
                            .fontWeight(.semibold)
                        
                    }
                    HStack{
                        Text("Tags")
                        Spacer()
                        Text("Tart, Alcoholic")
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                    }
                    HStack{
                        Text("Instructions")
                        Spacer()
                        Text(">")
                        
                    }
                    HStack{
                        Text("Ingridients")
                        Spacer()
                        Text(">")
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .listStyle(PlainListStyle())
                .padding(.trailing)
            
        }
            .padding()
        
    }
}

#Preview {
    MealDetailedItemView()
}
