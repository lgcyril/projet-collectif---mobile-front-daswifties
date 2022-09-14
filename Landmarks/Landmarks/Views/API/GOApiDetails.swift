//
//  GOApiDetails.swift
//  Landmarks
//  Created by Cyril with help of https://developer.apple.com/tutorials/swiftui/ on 06/09/2022.
import SwiftUI
import MapKit

struct GOApiDetails: View {
//  var landmark: Landmark
  let record : GORecordList2

    

    
    var body: some View {
        ScrollView {
            MapView(coordinate: CLLocationCoordinate2D(
                latitude: Double(record.Latitude),
                longitude: Double(record.Longitude)
            ))
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
            
            CircleImage(image: record.image)
                .offset(y: -130)
                .padding(.bottom, -130)
                .frame(width: 200, height: 200, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(record.Name)
                    .font(.title)
                
                HStack {
                    Text(record.City)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("Description :")
                    .font(.title2)
                Text(record.Description)
            }
            .padding()
        }
        .navigationTitle(record.Name)
        .navigationBarTitleDisplayMode(.inline)
 
    } // fin body
}  // fin apidetails


