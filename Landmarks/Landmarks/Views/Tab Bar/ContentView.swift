//
//  ContentView.swift
//  Landmarks
//
//  Created by Hôtes on 29/08/2022.
//

import SwiftUI
//import MapKit

struct ContentView: View {
    
    @State var showAlert = false
    @State var conditionAccepted = false
    
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
                
                DisplayMap()
                    .tabItem{
                        Image(systemName: "map")
                        Text("Carte")
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
            }
            
        } else {
            
            VStack{
                Text("La pratique Urbex est dangereuse, interdite et punie par la loi !")
                
                HStack{
                    
                    Button {
                        self.conditionAccepted = true
                    } label: {
                        Text("OK")
                            .padding()
                        
                    }
                    
                    Button {
                        self.conditionAccepted = true
                    } label: {
                        Text("En savoir plus !")
                            .padding()
                        
                    }
                    
                    Button {
                        self.showAlert = true
                    } label: {
                        Text("Refuser")
                            .alert("Nous ne pouvons pas vous donner accès à notre application", isPresented: $showAlert) {
                                Button("OK", role: .cancel) { }
                            }
                        
                        
                    }
                    
                }
            }
            
            //ImagesAdd()
            
        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            //MapView(coordinate: CLLocationCoordinate2D(latitude: 45.507818, longitude: 10.633923))
        }
    }
    
}
