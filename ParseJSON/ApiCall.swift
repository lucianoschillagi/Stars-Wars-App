//
//  ApiCall.swift
//  ParseJSON
//
//  Created by Luciano Schillagi on 3/15/20.
//  Copyright © 2020 Luciano Schillagi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetFilms : ObservableObject {
  
  @Published var filmDatas = [Film]()
  @Published var charactersDatas = [Characters]()
  
  init() {
          AF.request("https://swapi.co/api/films/").responseData { data in
              let json = try! JSON(data: data.data!)
            
              for item in json["results"] {
                  self.filmDatas.append(Film(id: item.1["episode_id"].intValue,
                                             title:item.1["title"].stringValue,
                                             director: item.1["director"].stringValue,
                                             producer: item.1["producer"].stringValue,
                                             releaseDate: item.1["release_date"].stringValue,
                                             charactersUrls: item.1["characters"].arrayValue.map{$0.stringValue}))
              }
            
            
            
            // 🤔
            for i in self.filmDatas {
                let array = i.charactersUrls
                    for i in array {
                        print(i)
                        AF.request(i).responseData { data in
                            let json = try! JSON(data: data.data!)
                            print(json)
                            for item in json {
                                self.charactersDatas.append(Characters(id: item.1["mass"].stringValue,
                                                                       name: item.1["name"].stringValue,
                                                                       birthYear: item.1["birth_year"].stringValue,
                                                                       gender: item.1["gender"].stringValue))
                            }
                        }
                    }
                }
            }
        }
    }


