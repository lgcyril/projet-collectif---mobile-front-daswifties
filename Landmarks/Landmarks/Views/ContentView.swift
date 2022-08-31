//
//  ContentView.swift
//  Landmarks
//
//  Created by Hôtes on 29/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        
        
        Menu("+") {
            Button("Liste", action: placeOrder)
            Button("Annuler", action: cancelOrder)
        }
        
        LandmarkList()
        //ImagesAdd()
      
    }
    
    func placeOrder(){}
    func cancelOrder(){}
    
    
    
}

       
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

