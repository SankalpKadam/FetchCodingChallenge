//
//  MealListItemViewModel.swift
//  FetchCodingChallenge
//
//  Created by Sankalp Kadam on 6/12/24.
//

import Foundation

final class MealListItemViewModel : ObservableObject {
    
    @Published var mealListItems : [MealListItem] = [MealListItem(id: "53409", itemTitle: "Apam Balik", itemImage: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")]
    
    func getMeals(){
        mealListItems.append(MealListItem(id: "53407", itemTitle: "Apam Balik", itemImage: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"))
        
            mealListItems.append(MealListItem(id: "3409", itemTitle: "Apam Balik", itemImage: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"))
        
            mealListItems.append(MealListItem(id: "409", itemTitle: "Apam Balik", itemImage: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"))
    }
    
}
