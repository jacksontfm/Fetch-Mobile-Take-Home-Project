//
//  RecipeTests.swift
//  RecipeTests
//
//  Created by Jackson Merle on 2/27/25.
//

import Testing
@testable import Fetch_Mobile_Take_Home_Project

struct RecipeTests {
    
    @Test("Recipes are retrieved from API")
    func retrieveRecipes() async throws {
        let recipeApp = await ContentView()
        let recipes = try await recipeApp.getRecipes(endpoint: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
        #expect(recipes != nil)
    }
    
    @Test("Recipes are not retrieved when data from API is malformed")
    func malformedRecipes() async throws {
        let recipeApp = await ContentView()
        await #expect(throws: RecipeError.invalidData) {
            try await recipeApp.getRecipes(endpoint: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")
        }
    }
    
    @Test("Recipes are not retrieved when API contains no data")
    func emptyRecipes() async throws {
        let recipeApp = await ContentView()
        let recipes = try await recipeApp.getRecipes(endpoint: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")
        #expect(recipes == [])
    }
}
