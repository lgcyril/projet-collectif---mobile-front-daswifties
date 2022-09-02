//
//  UrbexApi.swift
//  Landmarks
//
//  Created by Sandy CARDOSO SIBORRO on 02/09/2022.
//
import Foundation
import SwiftUI

struct RecordList: Decodable {
    let records : [Record]
}


struct Record: Decodable, Identifiable {
    let id: Int
    let fields: RecordField
}

struct RecordField: Decodable {
    let name: String
    let city: String
}

struct UrbexApi: View {
    @State private var records = [Record]()

        var body: some View {
            NavigationView {
                List(records) { record in
                    VStack(alignment: .leading) {
                        Text(record.name)
                            .font(.headline)
                        Text(record.city)
                    }
                }
                .navigationTitle("Inbox")
            }
            .task {
                do {
                    let url = URL(string: "https://api.airtable.com/v0/app88l0ueoC01CHj3/Sheet1?api_key=keyHlG3CSo3y465xM")!
                    let (data, _) = try await URLSession.shared.data(from: url)
                    records = try JSONDecoder().decode(RecordList.self, from: data)
                } catch {
                    records = []
                }
            }
        }
    }
