//
//  GOApiRow.swift
//  Landmarks
//
//  Created by Cyril with help of https://developer.apple.com/tutorials/swiftui/ on 07/09/2022.
//

import SwiftUI

struct GOApiRow: View {
    let record : GORecordList2
    
    var body: some View {
        HStack {
            record.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(record.Name)
            
            Spacer()
        }
    }
}


