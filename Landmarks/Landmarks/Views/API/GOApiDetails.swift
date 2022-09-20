//
//  GOApiDetails.swift
//  Landmarks
//  Created by Cyril with help of https://developer.apple.com/tutorials/swiftui/ on 06/09/2022.
import SwiftUI
import MapKit

struct GOApiDetails: View {
  let record : GORecordList2
    
    // POUR UPLOAD PHOTO PAR LA GALLERIE ON UTILISE VIEWMODEL
    @EnvironmentObject var vm: ViewModel
    
    
    var body: some View {
        ScrollView {
            MapView(coordinate: CLLocationCoordinate2D(
                latitude: Double(record.Latitude),
                longitude: Double(record.Longitude)
            ))
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
//            CircleImage(image: Image("Laos"))
            CircleImage(image: record.image)
//            CircleImage(image: $vm.image)
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


