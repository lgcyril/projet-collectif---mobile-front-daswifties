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
            List {
                
                //           Text(modelAPI.records[0].fields?.name ?? "default")
                ForEach(modelAPI.records, id: \.self) { record in
                    Text (record.fields?.name ?? "de")
                    
                }
                .navigationTitle("UrbeX Spots (by API)")
            }  // list
        }  // navigtionview
        
        
        
        //                NavigationView {
        //
        //
        //                    List(self.$modelAPI.records[]) { apicall  in
        //                        NavigationLink {
        //        //                    ApiDetails(ApiCall: apicall)
        ////                            Text(apicall.fields.name)
        //                        } label: {
        //        //                    ApiRow(ApiCall: apicall)
        //                        }
        //                    }
        //                    .navigationTitle("UrbeX Spots (by API)")
        //                }
        //
        //
    }  // fin body
}  // fin UrbexApi


struct UrbexApi_Previews: PreviewProvider {
    static var previews: some View {
        UrbexApi()
    }
}


