//import Foundation
//import SwiftUI
//
//struct RecordList: Decodable {
//    let records : [Record]
//}
//
//
//struct Record: Decodable, Identifiable {
//    let id: String
//    let fields: [Array](String)
//    let name: String
//    let city: String
//}
//
//struct UrbexApi: View {
//    @State private var records = [Record]()
//    var body: some View {
//        print(records)
//
//        //            NavigationView {
//        //                // List(records) { record in
//        //                    VStack(alignment: .leading) { print(records)
//        //                        Text(record.name)
//        //                            .font(.headline)
//        //                        Text(record.city)
//        //                    }
//        //                }
//        //                .navigationTitle("Inbox")
//        //            }
//        //            .task {
//        //                do {
//        //                    let url = URL(string: "https://api.airtable.com/v0/app88l0ueoC01CHj3/Sheet1?api_key=keybjDXBIWMrQtxKS")!
//        //                    let (data, _) = try await URLSession.shared.data(from: url)
//        //                    records = try JSONDecoder().decode(RecordList.self, from: data)
//        //                } catch {
//        //                    records = []
//        //                }
//        //            }
//    }
//}
//
//
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
