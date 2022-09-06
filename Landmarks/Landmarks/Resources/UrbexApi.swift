//import Foundation
//import SwiftUI
//
//struct RecordList: Decodable {
//    let records : [Record]
//}
//
//

import Foundation
import SwiftUI

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
}

struct Post:Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}

struct UrbexApi: View {
    @State private var records = [Record]()

        var body: some View {
            let message = Text("Test API")
            
//            VStack {
//                Image(systemName: "network")
//                Text("Test API")
//            }
            print(records)
            
//            let billTotal = Double(textField.text!) ?? 0.0
//            or providing a more advanced error handling
//
//            if let billTotal = Double(textField.text!) {
//                // do something with billTotal
//            } else {
//                // handle the error
//            }
            
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
//                    let url = URL(string: "https://api.airtable.com/v0/appOd9LKetjbpK9ry/Sheet1?api_key=key6CI84ofIkYQ4Ha")!
//                    let (data, _) = try await URLSession.shared.data(from: url)
//                    records = try JSONDecoder().decode(RecordList.self, from: data)
//            print(records.id)
//                } catch {
//                    records = []
//
//
//                }  // fin navigatiobiew
//            }
            
            
            func callAPI(){
                // test : https://jsonplaceholder.typicode.com/posts/1
                guard let url = URL(string: "https://api.airtable.com/v0/appOd9LKetjbpK9ry/Sheet1?api_key=key6CI84ofIkYQ4Ha") else{
                    return
                }


                let task = URLSession.shared.dataTask(with: url){
                    data, response, error in
                 
                   if let data = data, let string = String(data: data, encoding: .utf8){
             
                        print("CALL",string)
                    }
                }

                task.resume()
            }

           // callAPI()

            func decodeAPI(){
//                guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{return}
                guard let url = URL(string: "https://api.airtable.com/v0/appOd9LKetjbpK9ry/Sheet1?api_key=key6CI84ofIkYQ4Ha") else{return}

                let task = URLSession.shared.dataTask(with: url){
                    data, response, error in
                    
                    let decoder = JSONDecoder()

                    if let data = data{
                        do{
                            let tasks = try decoder.decode(RecordList.self, from: data)
                            tasks.records.forEach{ i in
                                print(i.fields?.name)
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

//// func loadData(start : Int, limit : Int, completion:@escaping ([ImageModel]) -> ()) {
////        http://jsonplaceholder.typicode.com/photos?_start=0&_limit=5
////    guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos?_start=\(start)&_limit=\(limit)") else {
////        print("Invalid url...")
////        return
////     }
////     URLSession.shared.dataTask(with: url) { data, response, error in
////        let images = try? JSONDecoder().decode([ImageModel].self, from: data!)
////         print(images ?? [])
////        DispatchQueue.main.async {
////            completion(images ?? [])
////        }
////    }.resume()

