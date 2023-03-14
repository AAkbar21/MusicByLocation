//
//  Artist.swift
//  MusicByLocation
//
//  Created by Akbar, Abdullah (RCH) on 04/03/2023.
//

import Foundation

struct Artist: Codable {
    var name : String
    
    private enum CodingKeys: String, CodingKey {
        case name = "artistName"
    }
}
