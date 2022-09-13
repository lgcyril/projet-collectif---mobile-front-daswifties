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
    @State var records = [GORecordList2]()
    @ObservedObject var modelGOAPI: ModelGOApi2 = ModelGOApi2()
    
    var body: some View {
 
       NavigationView {
           List (records, id: \.ID) {record in

               NavigationLink {
                   GOApiDetails(record: record)
               } label: {
                 //Text ("\(record.Name)")
                   GOApiRow(record: record) 
             }
         }
        .onAppear() {
            ModelGOApi2().loadData { (records) in
                          self.records = records
                      }
        }.navigationTitle("Urbex Spots (by API)")

      }  // navigtionview
        
    }  // fin body
}  // fin UrbexGOApi

struct UrbexGOApi_Previews: PreviewProvider {
    static var previews: some View {
        UrbexGOApi()
    }
}
