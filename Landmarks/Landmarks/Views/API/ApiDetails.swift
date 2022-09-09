//
//  ApiDetails.swift
//  Landmarks
//
//  Created by Cyril with help of https://developer.apple.com/tutorials/swiftui/ on 06/09/2022.



import SwiftUI
import MapKit

struct ApiDetails: View {
//   var landmark: Landmark
    @ObservedObject var modelAPI: ModelApi = ModelApi()
    
//    init() {
//        self.modelAPI.decodeAPI()
//    }
    
    var body: some View {
        ScrollView {
//            MapView(coordinate: landmark.locationCoordinate)
//            CLLocationCoordinate2D {
//                    CLLocationCoordinate2D(
//                        latitude: coordinates.latitude,
//                        longitude: coordinates.longitude)
//                }
            
            realmap()
//            MapView(coordinate: CLLocationCoordinate2D(
//                latitude: Double(modelAPI.records.$fields?.latitude ?? "default") ?? 5.55,
//                longitude: Double(modelAPI.records.fields?.longitude ?? "default") ?? 4.44
//            ))
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
// DISPLAY IMAGES : TO FINISH
//            UIImageView().load(url:  "https://dl.airtable.com/.attachments/1c5853ca90fbb2e67c0f2c14558b80b2/eb800b58/villagemartyr.jpg")
//            UIImageView().downloaded(from:  "https://dl.airtable.com/.attachments/1c5853ca90fbb2e67c0f2c14558b80b2/eb800b58/villagemartyr.jpg")
                        
//            CircleImage(image : UIImageView().load(url:  "https://dl.airtable.com/.attachments/1c5853ca90fbb2e67c0f2c14558b80b2/eb800b58/villagemartyr.jpg"))
//            CircleImage(image: ApiCall.records[0].fields?.images[0].url ?? "default")
//                .offset(y: -130)
//                .padding(.bottom, -130)
//                .frame(width: 200, height: 200, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(self.modelAPI.records[0].fields?.name ?? "default")
                    .font(.title)
                
                HStack {
                    
                    Text(modelAPI.records[0].fields?.city ?? "default")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("Description :")
                    .font(.title2)
                Text(modelAPI.records[0].fields?.description ?? "default")
            }
            .padding()
        }
        .navigationTitle(modelAPI.records[0].fields?.name ?? "default")
        .navigationBarTitleDisplayMode(.inline)
    
    } // fin body
}  // fin apidetails

//struct ApiDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ApiDetails(landmark: landmarks[0])
//    }
//}
