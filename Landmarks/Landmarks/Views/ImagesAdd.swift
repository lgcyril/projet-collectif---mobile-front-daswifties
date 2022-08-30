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
                    ZoomableScrollView {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.6)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.horizontal)
                    
                }
                HStack {
                    Button {
                        vm.source = .camera
                        vm.showPhotoPicker ()
                    } label: {
                        Text("Camera -∞-°")
                    }
                    Button {
                        vm.source = .library
                        vm.showPhotoPicker ()
                    } label: {
                        Text("  Ph@tos ∞")
                        
                    }
                    
                }
                Spacer ()
                
                Form {
                    TextField("Title : ",
                              text: $title)
                    TextField("Description : ",
                              text: $description)
                }.navigationBarTitle(Text(" @dd a new spt : ∞"))
                
            }
            .sheet(isPresented: $vm.showPicker) {
                ImagePicker(sourceType: vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image)
                    .ignoresSafeArea()
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
