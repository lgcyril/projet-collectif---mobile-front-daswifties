//
//  UrbexApi.swift
//  Landmarks
//
//  Created by Sandy CARDOSO SIBORRO on 02/09/2022.
//
import Foundation
import SwiftUI

struct RecordList: Decodable {
    let records : [Record]
}

struct Record: Decodable, Identifiable {
    let id: String
    let fields: RecordField
}

struct RecordField: Decodable {
    let name: String
    let city: String
}

struct Post:Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}

struct UrbexApi: View {
//    @State private var records = [Record]()

        var body: some View {
            let message = Text("Test API")
            
            VStack {
                Image(systemName: "network")
                Text("Test API")
            }
            //print(records)
//            NavigationView {
//                List(records) { record in
//                    VStack(alignment: .leading) {
//                        Text(record.name)
//                            .font(.headline)
//                        Text(record.city)
//                    }
//                }
//                .navigationTitle("Inbox")
//            }
//            .task {
//      do {
//                    let url = URL(string: "https://api.airtable.com/v0/app88l0ueoC01CHj3/Sheet1?api_key=keyHlG3CSo3y465xM")!
//                    let (data, _) = try await URLSession.shared.data(from: url)
//                    records = try JSONDecoder().decode(RecordList.self, from: data)
//            print(records.id)
//                } catch {
//                    records = []
//
//
//                }
//            }
            
            
            func callAPI(){
                guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else{
                    return
                }


                let task = URLSession.shared.dataTask(with: url){
                    data, response, error in
                    
                    if let data = data, let string = String(data: data, encoding: .utf8){
                        print(string)
                    }
                }

                task.resume()
            }

            callAPI()

            func decodeAPI(){
                guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{return}

                let task = URLSession.shared.dataTask(with: url){
                    data, response, error in
                    
                    let decoder = JSONDecoder()

                    if let data = data{
                        do{
                            let tasks = try decoder.decode([Post].self, from: data)
                            tasks.forEach{ i in
                                print(i.title)
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
                task.resume()

            }

            decodeAPI()

            return message
            
            
        }  // fin body
    }  // fin UrbexApi

struct UrbexApi_Previews: PreviewProvider {
    static var previews: some View {
        UrbexApi()
    }
}
