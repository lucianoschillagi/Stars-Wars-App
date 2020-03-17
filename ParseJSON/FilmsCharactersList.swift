//
//  FilmsCharactersList.swift
//  ParseJSON
//
//  Created by Luciano Schillagi on 3/15/20.
//  Copyright © 2020 Luciano Schillagi. All rights reserved.
//

import SwiftUI

struct FilmsCharactersList: View {
    
    var selectedFilm: Film
    
    var body: some View {
        List(selectedFilm.charactersUrls, id: \.self) { character in
            Text(character)
        }
    }
}


