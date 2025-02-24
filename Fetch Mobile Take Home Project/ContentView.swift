//
//  ContentView.swift
//  Fetch Mobile Take Home Project
//
//  Created by Jackson Merle on 2/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var recipes: [Recipe]?
    
    var body: some View {
        List {
            RecipeView(name: "Dummy", cuisine: "Shitty", photoURL: "e", sourceURL: "s", youtubeURL: "s")
            RecipeView(name: "Dummy", cuisine: "Shitty", photoURL: "e", sourceURL: "s", youtubeURL: "s")
        }
        .refreshable {
            await loadRecipes()
        }
        .padding()
        .task {
            await loadRecipes()
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
            print("loaded!")
        } //TODO: change these prints to toasts/popups
        catch RecipeError.invalidURL {
            print("Error: Invalid URL")
        } catch RecipeError.invalidResponse {
            print("Error: Invalid response")
        } catch RecipeError.invalidData {
            print("Error: Invalid data")
        } catch {
            print("Error: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
