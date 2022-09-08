import Foundation
import SwiftUI


// Affiche API
struct UrbexApi: View {
    
    
    @ObservedObject var modelAPI: ModelApi = ModelApi()
    
    
    init() {
        self.modelAPI.decodeAPI()
        
    }
    
    var body: some View {
//        ModelApi()
//        decodeAPI()
        List {
            Text("Hello 1")
            Text("Hello 2")
            //Text(modelAPI.$fields?.name ?? "default")
//            ForEach(modelAPI.records) { record in
//                Text(record.fields?.name ?? "de")
//            }
        }
        
        
        
        //        NavigationView {
        //            self.$modelAPI.decodeAPI()
        //            Text (records)
        //            List(self.$modelAPI.records) { apicall  in
        //                NavigationLink {
        ////                    ApiDetails(ApiCall: apicall)
        //                  //  Text(apicall.name)
        //                } label: {
        ////                    ApiRow(ApiCall: apicall)
        //                }
        //            }
        //            .navigationTitle("UrbeX Spots (by API)")
        //        }
        //
        //
    }  // fin body
}  // fin UrbexApi


struct UrbexApi_Previews: PreviewProvider {
    static var previews: some View {
        UrbexApi()
    }
}


