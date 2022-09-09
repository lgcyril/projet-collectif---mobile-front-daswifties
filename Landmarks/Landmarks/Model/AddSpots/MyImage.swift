//
//  MyImage.swift
//  Landmarks
//
//  Created by Cyril with help of https://www.youtube.com/watch?v=yMC16EZHwZU&t=0s on 30/08/2022.
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
