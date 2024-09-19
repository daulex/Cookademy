//
//  ContentView.swift
//  Cookademy
//
//  Created by kg on 17/09/2024.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject var recipeData = RecipeData()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationView{
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.mainInformation.name,
                                   destination: RecipeDetailView(recipe: recipe))
                }
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
            .navigationTitle(navigationTitle)
        }
        
    }
}

extension RecipesListView {
    var recipes: [Recipe] {
        recipeData.recipes
    }
    
    var navigationTitle: String {
        "All Recipes"
    }
}

#Preview {
    RecipesListView()
}
