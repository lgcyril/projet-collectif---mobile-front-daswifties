//
//  Picker.swift
//  Landmarks
//
//  Created by Hôtes on 30/08/2022.
//

import UIKit

enum Picker {
    enum Source: String {
        case library, camera
    }
    
    static func checkPermissions() -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            return true
        } else {
            return false
        }
        
    }
    
    
}
