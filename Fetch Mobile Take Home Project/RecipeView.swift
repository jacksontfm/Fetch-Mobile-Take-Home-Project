//
//  RecipeView.swift
//  Fetch Mobile Take Home Project
//
//  Created by Jackson Merle on 2/23/25.
//

import SwiftUI

struct RecipeView: View {
    var body: some View {
        HStack {
            Image(systemName: "sun.max.fill")
                .resizable()
                .frame(width: 90, height: 90)
                .border(.black)
            
            VStack(alignment: .leading) {
                Text("Recipe name")
                    .font(.headline)
                Text("Cuisine: American")
                Spacer()
            }
            .frame(height: 90)
            
            Spacer()
        }
        .background(.thinMaterial)
    }
}

#Preview {
    RecipeView()
}
