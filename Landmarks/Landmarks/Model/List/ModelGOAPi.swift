//
//  ModelGOAPi.swift
//  Landmarks
//
//  Created by Cyril with help of https://developer.apple.com/tutorials/swiftui/ on 06/09/2022.
//

import Foundation
import SwiftUI
import MapKit

// Modele de l'API : http://localhost:8080/urbexName/croixrouge
struct GORecordList: Codable {
    let ID: String
    let Name: String
    let City: String
    let Description: String
    let ImageName: String
}



// Affiche API
@MainActor final class ModelGOApi: ObservableObject {
//    @Published var records = [GORecordList]()
    @Published var records:  [GORecordList] =  []

    //    @Published var pointsOfInterest: [AnnotatedItem ] = []
    
    func decodeGOAPI(){
        let myURLString2 = "http://localhost:8080/urbexName/croixrouge"
        
        guard let url = URL(string: myURLString2) else{
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
                        let tasks = try JSONDecoder().decode(GORecordList.self, from: data)
//                        self.records = tasks
                    
        
                    }catch let error{
                        print("Error decoding : ",error)
                    }
                    
                }  // DISPATCHQUEUE
            }  // IF CODE 200
        } // TASK
        task.resume()
        
    } // DECODEAPI
    
}  // fin ModelAPi
