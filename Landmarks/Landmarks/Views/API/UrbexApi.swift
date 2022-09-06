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
            List(self.$modelAPI.records) { apicall  in
                    NavigationLink {
                        //  LandmarkDetail(landmark: landmark)
                    } label: {
                      //  LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("UrbeX Spots (by API)")
            }
        
        
    }  // fin body
}  // fin UrbexApi


struct UrbexApi_Previews: PreviewProvider {
    static var previews: some View {
        UrbexApi()
    }
}


