//
//  ApiRow.swift
//  Landmarks
//
//  Created by Hôtes on 07/09/2022.
//

import SwiftUI

struct ApiRow: View {
    var landmark: Landmark
       @ObservedObject var ApiCall: ModelApi = ModelApi()
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct ApiRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ApiRow(landmark: landmarks[0])
                .previewLayout(.fixed(width: 300, height: 70))
            ApiRow(landmark: landmarks[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }
        .previewLayout(.fixed(width: 300, height: 70))
        
    }
}

