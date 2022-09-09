//
//  Réglages.swift
//  Landmarks
//
//  Created by Sandy CARDOSO SIBORRO on 01/09/2022.
//

import SwiftUI

// DISPLAY LAW AND RULES
struct SettingsView: View {
    
    var body: some View {
        
        NavigationView {
            List {
                
                Section {
                    
                    // Loi
                    NavigationLink(destination: LawView()) {
                        Text("Loi")
                    }
                    
                    // Regles
                    NavigationLink(destination: RulesView()) {
                        Text("Règles")
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}



