//
//  ContentView.swift
//  ParseJSON
//
//  Created by Luciano Schillagi on 3/13/20.
//  Copyright © 2020 Luciano Schillagi. All rights reserved.
//

import SwiftUI

struct FilmList: View {
     
     @ObservedObject var getFilms = GetFilms()
    
     var body: some View {
        
        NavigationView {
            
            List(getFilms.filmDatas) { film in
                
                NavigationLink(destination: FilmsCharactersList(selectedFilm:film)) {
                    
                    FilmRow(title: film.title,
                            director: film.director,
                            releaseDate: film.releaseDate,
                            producer: film.producer)
                }
                
            }.navigationBarTitle("Stars Wars Films")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmList()
    }
}
