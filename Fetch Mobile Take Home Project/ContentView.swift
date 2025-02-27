//
//  ContentView.swift
//  Fetch Mobile Take Home Project
//
//  Created by Jackson Merle on 2/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var recipes: [Recipe] = []
    @State private var sortByName: Bool = true
    @State private var showingErrorMessage: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        
        HStack {
            
            Text("All recipes")
                .font(.headline)
                .padding(.leading)
            
            Spacer()
            
            Picker("Sort method", selection: $sortByName) {
                Text("Sort by name")
                    .tag(true)
                Text("Sort by cuisine")
                    .tag(false)
            }
            .padding(.trailing)
            .onChange(of: sortByName) {
                sortRecipes()
            }
        }
        
        ScrollView {
            if (recipes == []) {
                Text("No recipes found")
            } else {
                VStack {
                    ForEach(recipes, id: \.uuid) { recipe in
                        RecipeView(name: recipe.name, cuisine: recipe.cuisine, photoURL: recipe.photoUrlSmall, sourceURL: recipe.sourceUrl, youtubeURL: recipe.youtubeUrl)
                    }
                }
            }
        }
        .refreshable {
            await loadRecipes()
        }
        .padding()
        .task {
            await loadRecipes()
        }
        .alert("An error has occurred", isPresented: $showingErrorMessage) {
        } message: {
            Text(errorMessage)
        }
    }
    
    func getRecipes() async throws -> [Recipe] {
        
        let endpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        guard let url = URL(string: endpoint) else { throw RecipeError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw RecipeError.invalidResponse }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let decodedResponse = try decoder.decode(Response.self, from: data)
            return decodedResponse.recipes
        } catch {
            throw RecipeError.invalidData
        }
    }
    
    func loadRecipes() async {
        do {
            recipes = try await getRecipes()
            sortRecipes()
        }
        catch RecipeError.invalidURL {
            handleError(message: "Invalid URL")
        } catch RecipeError.invalidResponse {
            handleError(message: "Invalid response")
        } catch RecipeError.invalidData {
            handleError(message: "Invalid data in response")
        } catch {
            handleError(message: "Unexpected error: \(error)")
        }
    }
    
    func sortRecipes() {
        if sortByName {
            recipes.sort { $0.name < $1.name }
        } else {
            recipes.sort { $0.cuisine < $1.cuisine }
        }
    }
    
    func handleError(message: String) {
        recipes = []
        showingErrorMessage.toggle()
        errorMessage = message
    }
}

#Preview {
    ContentView()
}
