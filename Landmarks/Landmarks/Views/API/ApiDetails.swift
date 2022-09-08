//
//  ApiDetails.swift
//  Landmarks
//
//  Created by Hôtes on 06/09/2022.
//

//
//import SwiftUI
//
//struct ApiDetails: View {
//    var landmark: Landmark
//    @ObservedObject var ApiCall: ModelApi = ModelApi()
//    
//    init() {
//        self.ApiCall.decodeAPI()
//    }
//    
//    var body: some View {
//        ScrollView {
//            MapView(coordinate: landmark.locationCoordinate)
//                .ignoresSafeArea(edges: .top)
//                .frame(height: 300)
//            
//            CircleImage(image: landmark.image)
//                .offset(y: -130)
//                .padding(.bottom, -130)
//                .frame(width: 200, height: 200, alignment: .center)
//            
//            VStack(alignment: .leading) {
//                Text(self.ApiCall.name)
//                    .font(.title)
//                
//                HStack {
//                    
//                    Text(ApiCall.city)
//                }
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//                
//                Divider()
//                
//                Text("Description :")
//                    .font(.title2)
//                Text(ApiCall.description)
//            }
//            .padding()
//        }
//        .navigationTitle(ApiCall.name)
//        .navigationBarTitleDisplayMode(.inline)
//    } // fin body
//}  // fin apidetails
//
//struct ApiDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ApiDetails(landmark: landmarks[0])
//    }
//}
