//
//  ContentView.swift
//  Landmarks
//
//  Created by Hôtes on 29/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        
        //ImagesAdd()
        
        TabView{
            LandmarkList()
                .tabItem{
                    Image(systemName: "list.star")
                    Text("Liste")
                }
            Text("AddSpotView")
                .tabItem{
                    Image(systemName: "camera")
                    Text("Add Spot")
                }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

