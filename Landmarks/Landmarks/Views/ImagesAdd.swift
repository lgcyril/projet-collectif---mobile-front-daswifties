//
//  ImagesAdd.swift
//  Landmarks
//
//  Created by Hôtes on 30/08/2022.
//

import SwiftUI

struct ImagesAdd: View {
    @State private var title = ""
    @State private var description = ""
    @State private var place = ""
    @State private var photo = ""
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.6)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.horizontal)
                    
                }
                Spacer ()
                
                Form {
                    TextField("Title : ",
                                          text: $title)
                                TextField("Description : ",
                                          text: $description)
                }.navigationBarTitle(Text(" @dd a new spt : ∞"))
                
            }
            
        
        }
    }
}

struct ImagesAdd_Previews: PreviewProvider {
    static var previews: some View {
        ImagesAdd()
            .environmentObject(ViewModel())
    }
}
