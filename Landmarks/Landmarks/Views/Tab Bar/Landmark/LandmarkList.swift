//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Cyril with help of https://developer.apple.com/tutorials/swiftui/ on 29/08/2022.
//

import SwiftUI

struct LandmarkList: View {
    
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Urbex Spots")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
              .previewDevice(PreviewDevice(rawValue: deviceName))
              .previewDisplayName(deviceName)
        }
    }
}
