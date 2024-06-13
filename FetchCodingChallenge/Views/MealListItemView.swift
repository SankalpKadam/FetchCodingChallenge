//
//  MealListItem.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/12/24.
//

import SwiftUI

struct MealListItem: View {
    var body: some View {
        HStack{
            
            AsyncImage(url: URL(string:"https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"), content : {image in
                image.resizable()
                    .scaledToFit()
                    .frame(height:200)
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
            VStack (alignment:.leading) {
                Text("Adba Malik")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .minimumScaleFactor(0.5)
                
                Text("Dessert")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
//            VStack {
//                Text("Hello")
//                    .bold()
//                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                    
//            }
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//            .background(.white)
//            .opacity(0.8)
            
            
        }
    }
}

#Preview {
    MealListItem()
}
