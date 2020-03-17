//
//  FilmRow.swift
//  ParseJSON
//
//  Created by Luciano Schillagi on 3/15/20.
//  Copyright © 2020 Luciano Schillagi. All rights reserved.
//

import SwiftUI

struct FilmRow: View {
    
    @State private var showingWelcome = false
    
    var title: String
    var director: String
    var releaseDate: String
    var producer: String
    
    var body : some View {
        VStack {
            Text(title).fontWeight(.black)
            Text(director).fontWeight(.thin)
            Text(releaseDate).fontWeight(.regular)
            Toggle(isOn: $showingWelcome.animation()) {
                    Text("Produced by?")
                }
            
            if showingWelcome {
                Text(producer).fontWeight(.ultraLight)
            }
        }
    }
}
