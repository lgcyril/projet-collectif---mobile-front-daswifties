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
    @FocusState var nameField: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                
                if !vm.isEditing {
                    imageScroll
                }
               selectedImage
                
                VStack {
                    if vm.image != nil {
                        editGroup
                    }
                    if !vm.isEditing {
                        pickerButtons
                    }
                    
                }
                .padding()
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
                }.navigationBarTitle(Text(" Add Urbex Spot"))
                
            }
            .task {
                if FileManager().docExist(named: fileName) {
                    vm.loadMyImagesJSONFile()
                }
                
            }
            .sheet(isPresented: $vm.showPicker) {
                ImagePicker(sourceType: vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image)
                    .ignoresSafeArea()
            }
            .alert("Error", isPresented: $vm.showFileAlert, presenting: vm.appError, actions: {
                cameraError in
                cameraError.button
                
            }, message: { cameraError in
                Text (cameraError.message)
            })
            .navigationTitle("My Images")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Spacer ()
                        Button {
                            nameField = false
                            
                        } label : {
                            Image(systemName: "keyboard.chvron.compact.down")
                            
                            
                        }
                        
                        
                    }
                    
                }
                
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

