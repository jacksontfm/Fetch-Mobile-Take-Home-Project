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
    var sourceURL: String?
    var youtubeURL: String?
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: photoURL)!) { image in
                image
                    .resizable()
                    .cornerRadius(10)
            } placeholder: {
                Image(systemName: "fork.knife.circle.fill")
                    .resizable()
                    .foregroundColor(.secondary)
            }
            .frame(width: 90)
            
            VStack(alignment: .leading) {
                
                Text(name)
                    .font(.headline)
                    .scaledToFit()
                    .minimumScaleFactor(0.05)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("Cuisine: \(cuisine)")
                    .font(.subheadline)
                
                Spacer()
                
                if (sourceURL != nil) {
                    Link(destination: URL(string: sourceURL!)!) {
                        Text("View Full Recipe")
                            .foregroundColor(.blue)
                    }
                } else {
                    Text("Full recipe not available")
                        .foregroundColor(.secondary)
                }
                
                if (youtubeURL != nil) {
                    Link(destination: URL(string: youtubeURL!)!) {
                        Text("View on YouTube")
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 1)
                } else {
                    Text("YouTube video not available")
                        .foregroundColor(.secondary)
                }
            }
            .padding(.leading)
            
            Spacer()
        }
        .frame(height: 90)
        .padding()
        
        Divider()
    }
}

#Preview {
    RecipeView(name: "Seven Cheese Pizza", cuisine: "Italian", photoURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg", sourceURL: "google.com", youtubeURL: "youtube.com")
}
