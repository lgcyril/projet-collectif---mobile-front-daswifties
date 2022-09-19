//
//  ModelApi.swift
//  Landmarks
//
//  Created by Cyril with help of https://developer.apple.com/tutorials/swiftui/ on 06/09/2022.
//  POUR APPEL API AIRTABLE

import Foundation
import SwiftUI
import MapKit

// Modele de l'API : https://api.airtable.com/v0/appOd9LKetjbpK9ry/Sheet1?api_key=key6CI84ofIkYQ4Ha
struct RecordList: Decodable, Hashable {
    let records: [Record]
}

struct Record: Decodable, Identifiable, Hashable, Equatable {
    // Identifiable means that each item has a unique ID. Decodable means that it can be decoded - for example, we can transform a JSON object into this data model.
    let id: String
    let fields: RecordField?
}

struct RecordField: Decodable, Hashable{
    let name: String?
    let city: String?
    let description: String?
    let longitude: String?
    let latitude: String?
    let images:  [ImageModel]
}

struct ImageModel: Hashable, Decodable {
    let filename: String
    let url: String
}

// Affiche API
@MainActor final class ModelApi: ObservableObject {
    @Published var records: [Record] = []
    @Published var pointsOfInterest: [AnnotatedItem ] = []
    
    func decodeAPI(){
        let myURLString = "https://api.airtable.com/v0/appOd9LKetjbpK9ry/Sheet1?api_key=key6CI84ofIkYQ4Ha"
        
        guard let url = URL(string: myURLString) else{
            fatalError("Invalid url...")
        }
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest){
            (data, response, error) in
            if let error = error {
                print("Request error : ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            if response.statusCode == 200 {
                
                guard let data = data else { return }
                DispatchQueue.main.sync {
                    do{
                        let tasks = try JSONDecoder().decode(RecordList.self, from: data)
                        self.records = tasks.records
                    
                        tasks.records.forEach{ i in
                            // TESTS API CALL OK
                            // print("Name ",i.fields?.name ?? "default")
                            // print("City ",i.fields?.city ?? "default")
                            // print("Description ",i.fields?.description ?? "default")
                            // print("Longitude ",i.fields?.longitude ?? "default")
                            // print("Latitude ",i.fields?.latitude ?? "default")
                            self.pointsOfInterest.append(contentsOf:
                                                            [ AnnotatedItem(
                                                                name: i.fields?.name ?? "default",
                                                                coordinate: CLLocationCoordinate2D(
                                                                    latitude: Double(i.fields?.latitude ?? "default") ?? 5.55,
                                                                    longitude: Double(i.fields?.longitude ?? "default") ?? 4.44
                                                                ) // CLLocationCoordinate2D
                                                            ) // ANNOTATEDITEM
                                                            ]
                                                         
                            ) // append
                        }
                    }catch let error{
                        print("Error decoding : ",error)
                    }
                    
                }  // DISPATCHQUEUE
            }  // IF CODE 200
        } // TASK
        task.resume()
        
    } // DECODEAPI
    
}  // fin ModelAPi
