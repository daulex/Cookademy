//
//  RecipeData.swift
//  Cookademy
//
//  Created by kg on 19/09/2024.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
