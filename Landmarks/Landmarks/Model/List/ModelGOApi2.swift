//
//  ModelGOApi2.swift
//  Landmarks
//
import Foundation
import SwiftUI

// Modele de l'API : http://localhost:8080/urbexName/croixrouge
struct GORecordList2: Codable {
    let ID: String
    let Name: String
    let City: String
    let Description: String
//    let ImageName: String
    let Longitude: Double
    let Latitude: Double
    
    private var ImageName: String
    var image: Image {
        Image(ImageName)
    }
    
}



class ModelGOApi2 : ObservableObject{
    @Published var records = [GORecordList2]()
    
    func loadData(completion:@escaping ([GORecordList2]) -> ()) {
        guard let url = URL(string: "http://localhost:8080/urbex") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let records = try! JSONDecoder().decode([GORecordList2].self, from: data!)
            print(records)
            DispatchQueue.main.async {
                completion(records)
            }
        }.resume()
        
    }
}
