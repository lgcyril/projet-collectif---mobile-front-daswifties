//
//  ImagesAdd.swift
//  Landmarks
//
//  Created by Hôtes on 30/08/2022.
//

import SwiftUI

struct ImagesAdd: View {
    @State private var name = ""
    @State private var category = ""
    @State private var city = ""
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
                VStack {
                    TextField("Image Name", text: $vm.imageName)
                        .textFieldStyle(.roundedBorder)
                    
                HStack {
                    Button {
                        vm.source = .camera
                        vm.showPhotoPicker ()
                    } label: {
                        ButtonLabel(symbolName: "camera", label: "Camera")
                    }
                    Button {
                        vm.source = .library
                        vm.showPhotoPicker ()
                    } label: {
                        ButtonLabel(symbolName: "photo", label: "Ph@tos ∞")
                        
                    }
                    
                }
                }
                Spacer ()
                
                Form {
                    TextField("Name : ",
                              text: $name)
                    TextField("Category : ",
                              text: $category)
                    TextField("City : ",
                              text: $city)
                    TextField("Description : ",
                              text: $description)
                }.navigationBarTitle(Text(" @dd a new spt : ∞"))
                
            }
            .sheet(isPresented: $vm.showPicker) {
                ImagePicker(sourceType: vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image)
                    .ignoresSafeArea()
            }
            .alert("Error", isPresented: $vm.showCameraAlert, presenting: vm.cameraError, actions: {
                cameraError in
                cameraError.button
                
            }, message: { cameraError in
                Text (cameraError.message)
            })
            .navigationTitle("My Images")
            
        }
    }
}

struct ImagesAdd_Previews: PreviewProvider {
    static var previews: some View {
        ImagesAdd()
            .environmentObject(ViewModel())
    }
}
