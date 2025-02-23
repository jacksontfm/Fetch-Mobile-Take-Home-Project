//
//  Recipe.swift
//  Fetch Mobile Take Home Project
//
//  Created by Jackson Merle on 2/23/25.
//

import SwiftUI

struct Recipe: Codable {
    let cuisine: String
    let name: String
    let photo_url_large: String
    let photo_url_small: String
    let source_url: String
    let uuid: String
    let youtube_url: String
}
