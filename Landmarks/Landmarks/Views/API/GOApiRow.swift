//
//  GOApiRow.swift
//  Landmarks
//
//  Created by Cyril with help of https://developer.apple.com/tutorials/swiftui/ on 07/09/2022.
//

import SwiftUI

struct GOApiRow: View {
    //var landmark: Landmark
    @ObservedObject var modelAPI: ModelApi = ModelApi()
    let record : GORecordList2
    
    var body: some View {
        HStack {
//            landmark.image
//                .resizable()
//                .frame(width: 50, height: 50)
            Text(record.Name)
            
            Spacer()
        }
    }
}

struct GOApiRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            ApiRow(landmark: landmarks[0])
//                .previewLayout(.fixed(width: 300, height: 70))
//            ApiRow(landmark: landmarks[1])
//                .previewLayout(.fixed(width: 300, height: 70))
        }
        .previewLayout(.fixed(width: 300, height: 70))
        
    }
}

