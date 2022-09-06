//
//  ModelApi.swift
//  Landmarks
//
//  Created by Hôtes on 06/09/2022.
//

import Foundation


// Modele de l'API : https://api.airtable.com/v0/appOd9LKetjbpK9ry/Sheet1?api_key=key6CI84ofIkYQ4Ha
struct RecordList: Decodable {
    let records : [Record]
}

struct Record: Decodable, Identifiable {  // Identifiable means that each item has a unique ID. Decodable means that it can be decoded - for example, we can transform a JSON object into this data model.
    let id: String
    let fields: RecordField?
}

struct RecordField: Decodable {
    let name: String?
    let city: String?
    let description: String?
}


// Affiche API
@MainActor final class ModelApi: ObservableObject {
    @Published var records: [Record] = []
    
    func decodeAPI(){
        guard let url = URL(string: "https://api.airtable.com/v0/appOd9LKetjbpK9ry/Sheet1?api_key=key6CI84ofIkYQ4Ha") else{
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
                            print("Name ",i.fields?.name ?? "default")
                            print("City ",i.fields?.city ?? "default")
                            print("Description ",i.fields?.description ?? "default")
                            
                        }
                    }catch let error{
                        print("Error decoding : ",error)
                    }
                    
                }
            }
        }
        task.resume()
        
    }
    
}  // fin ModelAPi





