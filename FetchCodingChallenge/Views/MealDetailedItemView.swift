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
            
            MealCard(mealDetails: detailMeal, modelObject: detailedViewModel)
            
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

// Diplays the meal details by using the data fetched by the respective view model
struct MealCard: View {
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
