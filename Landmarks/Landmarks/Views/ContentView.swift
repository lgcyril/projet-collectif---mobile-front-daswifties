//
//  ContentView.swift
//  Landmarks
//
//  Created by Hôtes on 29/08/2022.
//

import SwiftUI
//import MapKit

struct ContentView: View {
    
    //var coordinate: CLLocationCoordinate2D
  
    var body: some View {
        
        
        Menu("+") {
            Button("Liste", action: placeOrder)
            Button("Annuler", action: cancelOrder)
        }
        //MapView(coordinate: CLLocationCoordinate2D(latitude: 45.507818, longitude: 10.633923))
        LandmarkList()
        //ImagesAdd()
      
    }
    
    func placeOrder(){}
    func cancelOrder(){}
    
    
    
}

       
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //MapView(coordinate: CLLocationCoordinate2D(latitude: 45.507818, longitude: 10.633923))
    }
}

