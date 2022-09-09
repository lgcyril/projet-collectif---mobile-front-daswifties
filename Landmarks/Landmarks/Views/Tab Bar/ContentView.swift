//
//  ContentView.swift
//  Landmarks
//
//  Created by Cyril with help of https://developer.apple.com/tutorials/swiftui/ on 29/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAlert = false
    @State var conditionAccepted = false
    @State var moreinfo = false
    
    var body: some View {
        
        if conditionAccepted {
            TabView{
                LandmarkList()
                    .tabItem{
                        Image(systemName: "list.star")
                        Text("Liste")
                    }
                
                UrbexApi()
                    .tabItem{
                        Image(systemName: "network")
                        Text("API")
                    }
                
                realmap()
                    .tabItem{
                        Image(systemName: "map")
                        Text("Map")
                    }
                
                ImagesAdd()
                    .environmentObject(ViewModel())
                    .tabItem{
                        Image(systemName: "camera")
                        Text("Add Spot")
                    }
                
                SettingsView()
                    .tabItem{
                        Image(systemName: "gear")
                        Text("Réglages")
                    }
            }  // TABVIEW
            
        } // IF
        
        else if
            
            moreinfo {
                LawView()
                Button {
                    self.moreinfo = false
                    
                } label: {
                    Text("Retour")
                }
            } // MOREINFO
        
        else {
            
            VStack{
                Text("La pratique Urbex est dangereuse,\ninterdite et punie par la loi !")
                
                HStack{
                    
                    Button {
                            self.conditionAccepted = true
                        } label: {
                            Text("OK")
                                .padding()
                        }
                    
                    Button {
                            self.moreinfo = true
                        } label: {
                            Text("En savoir plus !")
                                .padding()
                        }
                    
                    Button {
                            self.showAlert = true
                        } label: {
                            Text("Refuser")
                                .alert("Si vous refusez, nous ne pouvons pas vous donner accès à notre application...", isPresented: $showAlert) {
                                    Button("OK", role: .cancel) { }
                                }
                        } // label
                    
                }  // HSTACK
            }  // VSTACK
        }  // ELSE
    }  // CONTENTVIEW
    
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
 }
}
