//
//  MyImage.swift
//  Landmarks
//
//  Created by Hôtes on 30/08/2022.
//

import UIKit

struct MyImage: Identifiable, Codable {
    var id = UUID()
    var name: String
    
    var image: UIImage {
        do {
            return try FileManager().readImage(with: id)
        } catch {
            return UIImage(systemName: "photo.fill")!
        }
    }
}

