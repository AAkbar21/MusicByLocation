//
//  Artist Response.swift
//  MusicByLocation
//
//  Created by Akbar, Abdullah (RCH) on 04/03/2023.
//

import Foundation
import SwiftUI

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results
    }
}
