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

struct Recipe: Equatable, Codable {
    let cuisine: String
    let name: String
    let photoUrlLarge: String
    let photoUrlSmall: String
    let sourceUrl: String?
    let uuid: UUID
    let youtubeUrl: String?
}
