//
//  ContentView.swift
//  ParseJSON
//
//  Created by Luciano Schillagi on 3/13/20.
//  Copyright © 2020 Luciano Schillagi. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct ContentView: View {
    
     @ObservedObject var obs = Observer()
    
     var body: some View {
        
        NavigationView {
            
            List(obs.filmDatas) { i in
                
                FilmItem(title: i.title, director: i.director, releaseDate: i.releaseDate)
                
            }
        .navigationBarTitle("Stars Wars Films")
        }
    }
}

class Observer : ObservableObject {
    
    // un array para contener los datos recibidos de las películas
    @Published var filmDatas = [FilmData]()
    
    init() {
        
            // Solicita a "swapi" todos los films de stars wars
            AF.request("https://swapi.co/api/films/").responseData { data in
                
                debugPrint("Response: \(data)")
                
                // Convierte los datos recibidos a formato JSON
                let json = try! JSON(data: data.data!)
                
                // Recorre el array de strings contenido en "results"
                for item in json["results"] {
                    
                    // con cada item realiza el siguiente proceso:
                    // 1. extrae y puebla en cada interación una instancia
                    // de "filmsData" (cada instancia representa una película)
                    self.filmDatas.append(FilmData(id: item.1["episode_id"].intValue,
                                                   title:item.1["title"].stringValue,
                                                   director: item.1["director"].stringValue,
                                                   releaseDate: item.1["release_date"].stringValue,
                                                   characters: item.1["characters"].arrayValue.map{$0.stringValue}))
                
                
                    
                }
                
                // NOTE: test, remove later
                for item in self.filmDatas {
                    debugPrint(item.characters)
                }
                
            }
  
        }
        
    }

struct FilmData: Identifiable {
    var id: Int
    var title: String
    var director: String
    var releaseDate: String
    var characters: [String]
}

struct FilmItem: View {
    var title: String
    var director: String
    var releaseDate: String
    var body : some View {
        VStack {
                Text(title).fontWeight(.black)
                Text(director).fontWeight(.thin)
                Text(releaseDate).fontWeight(.regular)
               }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
