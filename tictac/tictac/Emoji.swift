//
//  Emoji.swift
//  tictac
//
//  Created by Даниил Ащев on 20.01.2021.
//

import Foundation

struct Emoji: Identifiable, Codable {
    let icon: String
    let name: String
    let decription: String
    
    var id: String { icon }
}
