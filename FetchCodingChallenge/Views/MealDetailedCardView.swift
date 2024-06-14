//
//  MealDetailedCardView.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/14/24.
//

import SwiftUI

// Diplays the meal details by using the data fetched by the respective view model
struct MealDetailedCardView: View {
    var mealDetails: MealDetailedView
    var modelObject: MealDetailedViewModel
    
    var body: some View {
        
        ScrollView{
            VStack {
                Text(mealDetails.strMeal ?? "")
                    .font(.headline)
                
                
                AsyncImage(url: URL(string:mealDetails.strMealThumb ?? ""), content : {image in
                    image.resizable()
                        .scaledToFit()
                        .frame(height:UIScreen.main.bounds.height/2)
                        .cornerRadius(4)
                    
                },placeholder: {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height/2)
                        .cornerRadius(4)
                        .opacity(0.4)
                })
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                

                HStack{
                    Text("Category")
                    Spacer()
                    Text(mealDetails.strCategory ?? "")
                        .fontWeight(.semibold)
                    
                }
                
                .overlay(VStack{
                    Divider().offset(x:0,y: 15)
                })
                .padding()
                
                
                HStack{
                    Text("Area")
                    Spacer()
                    Text(mealDetails.strArea ?? "")
                        .fontWeight(.semibold)
                    
                }
                .overlay(VStack{
                    Divider().offset(x:0,y: 15)
                })
                .padding()
                
                
                HStack{
                    Text("Tags")
                    Spacer()
                    Text(mealDetails.strTags ?? " ")
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    
                }
                .overlay(VStack{
                    Divider().offset(x:0,y: 15)
                })
                .padding()
                
                
                NavigationLink(destination: InstructionsView(detailedInstructions: mealDetails.strInstructions ?? "", modelObject: modelObject), label:
                                {
                    HStack{
                        Text("Instructions")
                        Spacer()
                        
                    }
                    
                })
                .overlay(VStack{
                    Divider().offset(x:0,y: 15)
                })
                .padding()
                
                
                NavigationLink(destination: IngredientsView(detailedMeal: mealDetails, modelObject: modelObject), label:  {
                    HStack{
                        Text("Ingridients")
                        Spacer()
                        
                    }
                    
                }).overlay(VStack{
                    Divider().offset(x:0,y: 15)
                })
                .padding()
                
            }
            
        }
    }
}


#Preview {
    MealDetailedCardView(mealDetails: MealDetailedView(idMeal: "1"), modelObject: MealDetailedViewModel())
}
