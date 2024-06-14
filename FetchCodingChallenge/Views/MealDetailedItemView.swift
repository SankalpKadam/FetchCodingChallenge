//
//  MealDetailedView.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/13/24.
//

import SwiftUI

struct MealDetailedItemView: View {
    var mealId: String
    @StateObject var detailedViewModel: MealDetailedViewModel = MealDetailedViewModel()
    
    @State private var detailMeal: MealDetailedView = MealDetailedView(idMeal: "53049")
    var body: some View {
        NavigationView {
//            List (detailedViewModel.detailedMeal){
//                item in
//                MealCard(mealDetails: item)
//            }
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
//            .listStyle(PlainListStyle())
            MealCard(mealDetails: detailMeal)
            
        }
        .task {
            do{
                detailMeal = try await detailedViewModel.getMealDetails(forMealId: mealId)
                
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

struct MealCard: View {
    var mealDetails: MealDetailedView
    var body: some View {
        
        VStack {
            
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
            
            //                List {
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
            
            NavigationLink(destination: InstructionsView(detailedInstructions: mealDetails.strInstructions ?? ""), label:
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
            NavigationLink(destination: IngredientsView(detailedMeal: mealDetails), label:  {
                HStack{
                    Text("Ingridients")
                    Spacer()
                    
                }
                
            }).overlay(VStack{
                Divider().offset(x:0,y: 15)
            })
        .padding()
            
            //                }
            //                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            //                .listStyle(PlainListStyle())
            //                .padding(.trailing)
            
        }
        
    }
}


struct IngredientsView:View {
    var detailedMeal: MealDetailedView
    
    var body: some View {
            //        Text(ingredientList.ingredients[0])
        VStack (alignment:.leading) {
                //            ForEach{
                
            if let ingredient1 = detailedMeal.strIngredient1{
                Text(ingredient1).overlay(VStack{
                    Divider().offset(x:0,y: 15)
                })
                .padding(EdgeInsets(
                    top: 2, leading: 0, bottom: 0, trailing: 0
                ))
            }
            if let ingredient2 = detailedMeal.strIngredient2{
                Text(ingredient2)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient3 = detailedMeal.strIngredient3{
                Text(ingredient3)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient4 = detailedMeal.strIngredient4{
                Text(ingredient4)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient5 = detailedMeal.strIngredient5{
                Text(ingredient5)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient6 = detailedMeal.strIngredient6{
                Text(ingredient6)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient7 = detailedMeal.strIngredient7{
                Text(ingredient7)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient8 = detailedMeal.strIngredient8{
                Text(ingredient8)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient9 = detailedMeal.strIngredient9{
                Text(ingredient9)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient10 = detailedMeal.strIngredient10{
                Text(ingredient10)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient11 = detailedMeal.strIngredient11{
                Text(ingredient11)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient12 = detailedMeal.strIngredient12{
                Text(ingredient12)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient13 = detailedMeal.strIngredient13{
                Text(ingredient13)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient14 = detailedMeal.strIngredient14{
                Text(ingredient14)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient15 = detailedMeal.strIngredient15{
                Text(ingredient15)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient16 = detailedMeal.strIngredient16{
                Text(ingredient16)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient17 = detailedMeal.strIngredient17{
                Text(ingredient17)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient18 = detailedMeal.strIngredient18{
                Text(ingredient18)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient19 = detailedMeal.strIngredient19{
                Text(ingredient19)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
            if let ingredient20 = detailedMeal.strIngredient20{
                Text(ingredient20)
                    .overlay(VStack{
                        Divider().offset(x:0,y: 15)
                    })
                    .padding(EdgeInsets(
                        top: 2, leading: 0, bottom: 0, trailing: 0
                    ))
            }
                //            }
                //            Text("\(ingredientList.ingredients[item])")
            }
    }
}


struct InstructionsView: View {
    var detailedInstructions: String
    var body: some View {
        Text(detailedInstructions)
    }
}
