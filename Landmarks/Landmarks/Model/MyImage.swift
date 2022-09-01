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
<<<<<<< HEAD
=======
            
            
>>>>>>> 8c52e4a7195b746393900ac06fe6dab182fa742a
        }
    }
}

