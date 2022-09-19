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
        .onAppear() {  // APPEL API GO AVEC METHODE ONAPPEAR
            ModelGOApi2().loadData { (records) in
                          self.records = records  // REMPLI LE TABLEAU RECORDS
               
                      }
        }.navigationTitle("Urbex Spots")

      }  // navigtionview
        
    }  // fin body
}  // fin UrbexGOApi

struct UrbexGOApi_Previews: PreviewProvider {
    static var previews: some View {
        UrbexGOApi()
    }
}
