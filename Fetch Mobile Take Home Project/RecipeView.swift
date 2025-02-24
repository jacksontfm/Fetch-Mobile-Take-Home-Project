//
//  RecipeView.swift
//  Fetch Mobile Take Home Project
//
//  Created by Jackson Merle on 2/23/25.
//

import SwiftUI

struct RecipeView: View {
    
    var name: String
    var cuisine: String
    var photoURL: String
    var sourceURL: String
    var youtubeURL: String
    
    var body: some View {
        HStack {
            Image(systemName: "sun.max.fill")
                .resizable()
                .frame(width: 90, height: 90)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text("Cuisine: \(cuisine)")
                Spacer()
                Text("View Full Recipe")
                Text("View on YouTube")
            }
            .padding(.leading)
            .frame(height: 90)
            
            Spacer()
        }
        .padding()
        .background(.thinMaterial)
    }
}

#Preview {
    RecipeView(name: "Seven Cheese Pizza", cuisine: "Tototo", photoURL: "photo.com", sourceURL: "source.com", youtubeURL: "youtube.com")
}
