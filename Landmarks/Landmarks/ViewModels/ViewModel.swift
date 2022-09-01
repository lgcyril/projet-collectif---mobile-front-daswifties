//
//  ViewModel.swift
//  Landmarks
//
//  Created by Hôtes on 30/08/2022.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: Picker.Source = .library
    @Published var showCameraAlert = false
    //@Published var cameraError: Picker.CameraErrorType?
    @Published var imageName: String = ""
    
    func showPhotoPicker() {
        do {
        if source == .camera {
            if !Picker.checkPermissions() {
                print ("There is no camera in this device")
                return
            }
        }
        showPicker = true
    }
}
}
