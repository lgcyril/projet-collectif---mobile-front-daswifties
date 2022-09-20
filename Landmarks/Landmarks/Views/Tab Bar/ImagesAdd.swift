//
//  ImagesAdd.swift
//  Landmarks
//
//  Created by Cyril with help of https://www.youtube.com/watch?v=yMC16EZHwZU&t=0s on 30/08/2022.
// https://medium.com/swlh/how-to-open-the-camera-and-photo-library-in-swiftui-9693f9d4586b

import SwiftUI
import UIKit

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
    @State var records = [GORecordList2]()
    
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
                
                // ADD DESCRIPTION OF URBEX SPOTS : => TO FINISH ADD IMAGE FROM GO OR GALLERY?
                Form {
                    HStack {
                        Text("Name :").bold()
                        Divider()
                        TextField("name",
                                  text: $name)
                    }
                    HStack {
                        Text("City    :").bold()
                        Divider()
                        TextField("city",
                                  text: $city)
                    }
                    HStack {
                        Text("Description").bold()
                        Divider()
                        TextField("description",
                                  text: $description)
                    }
                    
                    
                    VStack { //For Button VALID
                        Spacer()
                        
                        HStack {
                            Spacer()
                            Button{
                                ModelGOApi2().loadData { (record) in
                                    self.records = record  // REMPLI LE TABLEAU RECORDS
                                    //                                    print("\n\n\nID : ", $records.ID)
                                }
                                
                                print("\n\n\nName : ", name)
                                print("City : ", city)
                                print("Description : ", description)
                                print("Image : ", vm.imageName)
                                print("\n\n\n")
                                AddSpot(name, city, description)
                            }
                        label: {
                            ButtonLabel(symbolName: "checkmark.circle", label: "Valid")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        Spacer()
                        }
                    }  // button
                }  // FORM
                
            }.navigationBarTitle(Text(" Add Urbex Spot"), displayMode: .inline)  // VSTACK
            
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

//struct ImagesAdd_Previews: PreviewProvider {
//    static var previews: some View {
//        ImagesAdd()
//            .environmentObject(ViewModel())
//    }
//}

