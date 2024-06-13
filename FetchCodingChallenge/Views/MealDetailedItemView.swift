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
    
    
    var body: some View {
        NavigationView {
            List (detailedViewModel.detailedMeal){
                item in
                MealCard(mealDetails: item)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .listStyle(PlainListStyle())
            .task {
                do{
                    print(mealId)
                    try await detailedViewModel.getMealDetails(forMealId: mealId)
                    
                }catch {
                    print("some error")
                }
            }
        }
    }
}

#Preview {
    MealDetailedItemView(mealId: "52767")
}

struct MealCard: View {
    var mealDetails: MealDetailedView
    var body: some View {
        
        VStack {
            
            AsyncImage(url: URL(string:mealDetails.strMealThumb), content : {image in
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
                Text(mealDetails.strCategory)
                    .fontWeight(.semibold)
                
            }
            
            .overlay(VStack{
                Divider().offset(x:0,y: 15)
            })
            .padding()
            HStack{
                Text("Area")
                Spacer()
                Text(mealDetails.strArea!)
                    .fontWeight(.semibold)
                
            }
            .overlay(VStack{
                Divider().offset(x:0,y: 15)
            })
            .padding()
            HStack{
                Text("Tags")
                Spacer()
                Text(mealDetails.strTags!)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
            }
            .overlay(VStack{
                Divider().offset(x:0,y: 15)
            })
            .padding()
            
            NavigationLink(destination: InstructionsView(), label:
                            {
                HStack{
                    Text("Instructions")
                    Spacer()
                    
                }
                .overlay(VStack{
                    Divider().offset(x:0,y: 15)
                })
                .padding()
            })
            HStack{
                Text("Ingridients")
                Spacer()
                Text("Tap to Open")
                    .fontWeight(.light)
                    .font(.caption2)
            }
            .overlay(VStack{
                Divider().offset(x:0,y: 15)
            })
            .padding()
            
            //                }
            //                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            //                .listStyle(PlainListStyle())
            //                .padding(.trailing)
            
        }
        .padding()
        
    }
}


struct InstructionsView:View {
    var body: some View {
        Text ("Hello")
    }
}
