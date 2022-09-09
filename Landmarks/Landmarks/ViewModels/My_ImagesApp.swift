//
//  My_ImagesApp.swift
//  Landmarks
//
//  Created by Cyril with help of https://www.youtube.com/watch?v=yMC16EZHwZU&t=0s on 30/08/2022.
//

import SwiftUI


struct My_ImagesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey:  "_UIConstraintBasedLayoutLogUnsatisfiable" )
                    
                }
        }
        
    }
    
    
}
