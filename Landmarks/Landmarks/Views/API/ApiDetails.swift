//
//  ApiDetails.swift
//  Landmarks
//
//  Created by Hôtes on 06/09/2022.



import SwiftUI

struct ApiDetails: View {
    var landmark: Landmark
    @ObservedObject var ApiCall: ModelApi = ModelApi()
    
//    init() {
//        self.ApiCall.decodeAPI()
//    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
//            UIImageView().load(url:  "https://dl.airtable.com/.attachments/1c5853ca90fbb2e67c0f2c14558b80b2/eb800b58/villagemartyr.jpg")
//            UIImageView().downloaded(from:  "https://dl.airtable.com/.attachments/1c5853ca90fbb2e67c0f2c14558b80b2/eb800b58/villagemartyr.jpg")
                        
//            CircleImage(image : UIImageView().load(url:  "https://dl.airtable.com/.attachments/1c5853ca90fbb2e67c0f2c14558b80b2/eb800b58/villagemartyr.jpg"))
//            CircleImage(image: ApiCall.records[0].fields?.images[0].url ?? "default")
//                .offset(y: -130)
//                .padding(.bottom, -130)
//                .frame(width: 200, height: 200, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(self.ApiCall.records[0].fields?.name ?? "default")
                    .font(.title)
                
                HStack {
                    
                    Text(ApiCall.records[0].fields?.city ?? "default")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("Description :")
                    .font(.title2)
                Text(ApiCall.records[0].fields?.description ?? "default")
            }
            .padding()
        }
        .navigationTitle(ApiCall.records[0].fields?.name ?? "default")
        .navigationBarTitleDisplayMode(.inline)
    
    } // fin body
}  // fin apidetails

//struct ApiDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ApiDetails(landmark: landmarks[0])
//    }
//}
