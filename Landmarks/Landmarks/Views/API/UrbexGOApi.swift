//
//  UrbexGOApi.swift
//  Landmarks
//
//  Created by Cyril with help of https://developer.apple.com/tutorials/swiftui/ on 07/09/2022.
//

import Foundation
import SwiftUI


// Affiche API
struct UrbexGOApi: View {
 //   @Environment(\.openURL) private var openURL
    @State var records = [GORecordList2]()
//    @ObservedObject var modelGOAPI: ModelGOApi = ModelGOApi()
//
//    init() {
//        self.modelGOAPI.decodeGOAPI()
//    }
    
    var body: some View {
        // Déclaration
//               let myURLString = "http://localhost:8080/urbexName/croixrouge"
//               guard let myURL = URL(string: myURLString) else {
//                   Text("Error: \(myURLString) doesn't seem to be a valid URL")
//                  return
//               }
        
     
        
       NavigationView {
         List (records) {records in
         
         
            // Variable contenant Code source
//            do {
//                let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
//                print("HTML : \(myHTMLString)")
//            } catch let error {
//                print("Error: \(error)")
//            }
                    
   
             
             
             NavigationLink {
                 Text ("\(records.Name)")

             } label: {
                 Text ("\(records.Name)")


             }
         }
        .onAppear() {
            ModelGOApi2().loadData { (records) in
                          self.records = records
                      }
        }
             .navigationTitle("Urbex Spots (by API)")
//
             
             
             
//                   Button {
//                       if let url = URL(string: "http://localhost:8080/urbexName/croixrouge") {
//                           openURL(url)
//                       }
//                   } label: {
//                       Label("Get Help", systemImage: "person.fill.questionmark")
//                   }
               
 //        }  // list
      }  // navigtionview
        
    }  // fin body
}  // fin UrbexGOApi

struct UrbexGOApi_Previews: PreviewProvider {
    static var previews: some View {
        UrbexGOApi()
    }
}

