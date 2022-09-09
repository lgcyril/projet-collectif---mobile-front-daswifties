//
//  ImagesAdd.swift
//  Landmarks
//
//  Created by Cyril with help of https://www.youtube.com/watch?v=yMC16EZHwZU&t=0s on 30/08/2022.
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
    @State private var confirm = false
    
    // ADD PICTS FROM GALLERY OR CAMERA
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
                
                // ADD DESCRIPTION OF URBEX SPOTS : => TO FINISH
                Form {
                    TextField("Name : ",
                              text: $name)
                    TextField("Category : ",
                              text: $category)
                    TextField("City : ",
                              text: $city)
                    TextField("Description : ",
                              text: $description)
                    
                    Spacer ()
                    
                    Button{
                    } label: {
                        ButtonLabel(symbolName: "checkmark.circle", label: "Valid")
                    }.frame(alignment: .center )
                        .padding()
                        .alert("Thank you!", isPresented: $confirm) {Button("OK"){}} message: {            Text("Validated")}
                }  // FORM
            // VSTACK :
            }.navigationBarTitle(Text(" Add Urbex Spot"), displayMode: .inline)
            
            // NAVIGATIONVIEW
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
                        } // HSTACK
                    } // TOOLBARITEM
                } // TOOLBAR
        }  // NAVIGATIONVIEW
    }  // BODY
}  // IMAGESADD

struct ImagesAdd_Previews: PreviewProvider {
    static var previews: some View {
        ImagesAdd()
            .environmentObject(ViewModel())
    }
}

