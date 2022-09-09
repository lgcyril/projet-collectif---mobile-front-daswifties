//
//  Created by Cyril with help of https://developer.apple.com/tutorials/swiftui/ on 07/09/2022.
//

import Foundation
import SwiftUI


// Affiche API
struct UrbexApi: View {

    @ObservedObject var modelAPI: ModelApi = ModelApi()
    
    init() {
        self.modelAPI.decodeAPI()
    }
    
    var body: some View {
        
        NavigationView {
            List (modelAPI.records) {records in
                
                //type(of: records)
                
// https://stackoverflow.com/questions/56535326/what-is-the-difference-between-list-and-foreach-in-swiftui#:~:text=Simple%20explanation%3A,view%2C%20and%20it's%20also%20scrollable)
// List behaves like a UIScrollView (an arbitrarily long scrollable view of views)
// ForEach behaves kind of like a UITableView (where each of the elements gets a cell view, and it's also scrollable)
                // ForEach(modelAPI.records, id: \.self) { records in
                
                NavigationLink {
                    Text (records.fields?.name ?? "default")
                    // ApiDetails(ApiCall: apicall)
                    
                } label: {
                    Text (records.fields?.name ?? "default")
//                    ApiRow(modelAPI: self.modelAPI  )
                }
                
                //                }  // foreach
                .navigationTitle("Urbex Spots (by API)")
            }  // list
            
        }  // navigtionview
        
    }  // fin body
}  // fin UrbexApi


struct UrbexApi_Previews: PreviewProvider {
    static var previews: some View {
        UrbexApi()
    }
}


