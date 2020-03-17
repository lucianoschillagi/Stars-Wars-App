//
//  Film.swift
//  ParseJSON
//
//  Created by Luciano Schillagi on 3/15/20.
//  Copyright © 2020 Luciano Schillagi. All rights reserved.
//

import Foundation

struct Film: Identifiable {
    var id: Int
    var title: String
    var director: String
    var producer: String
    var releaseDate: String
    var charactersUrls: [String]
}

