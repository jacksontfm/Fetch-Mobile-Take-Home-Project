//
//  Recipe.swift
//  Fetch Mobile Take Home Project
//
//  Created by Jackson Merle on 2/23/25.
//

import SwiftUI

struct Response: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable {
    let cuisine: String
    let name: String
    let photoUrlLarge: String
    let photoUrlSmall: String
    let sourceUrl: String?
    let uuid: String
    let youtubeUrl: String?
}
