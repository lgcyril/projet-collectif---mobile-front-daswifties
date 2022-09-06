//
//  Réglages.swift
//  Landmarks
//
//  Created by Sandy CARDOSO SIBORRO on 01/09/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List{
            Section(header: Text("La loi et les règles")){

                NavigationLink(destination: LawView()) {
                            Text("Loi")
                          }

                NavigationLink(destination: RulesView()) {
                    Text("Règles")
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
