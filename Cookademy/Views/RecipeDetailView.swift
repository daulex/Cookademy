//
//  RecipeDetailView.swift
//  Cookademy
//
//  Created by kg on 19/09/2024.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack{
            HStack{
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack{
                Text(recipe.mainInformation.description)
                    .font(.callout)
                    .padding()
                Spacer()
            }
            List {
                Section(header: Text("Ingredients")) {
                    ForEach(recipe.ingredients.indices, id: \.self) {index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                    }.listRowBackground(listBackgroundColor)
                }
                Section(header: Text("Directions")) {
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        let direction = recipe.directions[index]
                        HStack(alignment:.top, content: {
                            Text("\(index + 1). ").bold()
                            Text("\(direction.isOptional ? "(Optional)" : "")" + "\(direction.description)")
                        })
                    }.listRowBackground(listBackgroundColor)
                }
            }
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe.testRecipes[0])
    }
}
