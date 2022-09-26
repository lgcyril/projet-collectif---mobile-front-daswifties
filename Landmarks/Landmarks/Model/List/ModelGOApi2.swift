//
//  ModelGOApi2.swift
//  Landmarks
//  Created by Cyril with help of https://medium.com/@nutanbhogendrasharma/consume-rest-api-in-swiftui-ios-mobile-app-b3c5d6ecf401on 06/09/2022.

import Foundation
import SwiftUI

// Modele de l'API : http://localhost:8080/api/urbex
//   https://projet-collectif-mobile-front-daswifties.vercel.app/api/getall
struct GORecordList2: Codable {
    let ID: String
    let Name: String
    let City: String
    let Description: String
    let Longitude: Double
    let Latitude: Double
    
    private var ImageName: String
    var image: Image {
        Image(ImageName)
    }
    
}


// LOAD GO API IN LOCALHOST : TO FIND A CLOUD LIKE HEROKU, VERCEL....
class ModelGOApi2 : ObservableObject{
    @Published var records = [GORecordList2]()
 //   let urlApi:String = "http://localhost:8080/api/urbex"
    let urlApi:String = "https://projet-collectif-mobile-front-daswifties.vercel.app/api/getall"
    
    func loadData(completion:@escaping ([GORecordList2]) -> ()) {
        guard let url = URL(string: urlApi) else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let records = try! JSONDecoder().decode([GORecordList2].self, from: data!)
//            print(records)
            DispatchQueue.main.async {
                completion(records)
            }
        }.resume()
        
    }
}
