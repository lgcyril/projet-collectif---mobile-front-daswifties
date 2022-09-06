import SwiftUI

// SwiftUI gives us the @ObservedObject property wrapper so that views can watch the state of an external object, and be notified when something important has changed. It is similar in behavior to @StateObject, except it must not be used to create objects – use @ObservableObject only with objects that have been created elsewhere, otherwise SwiftUI might accidentally destroy the object.
class ViewModel: ObservableObject {
    @Published var image: UIImage?   // whenever an object with a property marked @Published is changed, all views using that object will be reloaded to reflect those changes.
    @Published var showPicker = false
    @Published var source: Picker.Source = .library
    @Published var showCameraAlert = false
    @Published var cameraError: Picker.CameraErrorType?
    @Published var imageName: String = ""
    @Published var isEditing = false
    @Published var selectedImage: MyImage?
    @Published var myImages: [MyImage] = []
    @Published var showFileAlert = false
    @Published var appError: MyImageError.ErrorType?
    
    init() {
        print(FileManager.docDirURL.path)
        
    }
    
    var buttonDisabled: Bool {
        imageName.isEmpty || image == nil
        
    }
    var deleteButtonIsHidden: Bool {
        isEditing || selectedImage == nil
        
    }
    
    
    func showPhotoPicker() {
        do {
            if source == .camera {
                try Picker.checkPermissions()
            }
            
            showPicker = true
            
        } catch {
            showCameraAlert = true
            cameraError = Picker.CameraErrorType(error: error as! Picker.PickerError)
        }
    }
    
    func reset() {
        image = nil
        imageName = ""
        isEditing = false
        selectedImage = nil
        
    }
    
    func display(_ myImage: MyImage) {
        image = myImage.image
        imageName = myImage.name
        selectedImage = myImage
        
        
    }
    
    func updateSelected() {
        if let index = myImages.firstIndex(where: {$0.id == selectedImage!.id }) {
            myImages[index].name = imageName
            saveMyImagesJSONFile()
            reset()
        }
        
    }
    
    func deleteSelected() {
        if let index = myImages.firstIndex(where: {$0.id == selectedImage!.id }) {
            myImages.remove(at: index)
            saveMyImagesJSONFile()
            reset()
        }
        
    }
    
    func addMyImage(_ name: String, image: UIImage) {
        reset()
        let myImage = MyImage(name: name)
        do {
            try FileManager().saveImage("\(myImage.id)", image: image)
            myImages.append(myImage)
            saveMyImagesJSONFile()
        } catch {
            showFileAlert = true
            appError = MyImageError.ErrorType(error: error as! MyImageError)
        }
        
        
        
    }
    
    
    
    func saveMyImagesJSONFile() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(myImages)
            let jsonString = String(decoding: data, as: UTF8.self )
            reset()
            do {
                try FileManager().saveDocument(contents: jsonString)
                
            }
            catch {
                showFileAlert = true
                appError = MyImageError.ErrorType(error: error as! MyImageError)
                
            }
        } catch {
            showFileAlert = true
            appError = MyImageError.ErrorType(error: .encodingError)
        }
    }
    
    func loadMyImagesJSONFile() {
        do {
            let data = try FileManager().readDocument()
            let decoder = JSONDecoder()
            do {
                myImages = try decoder.decode([MyImage].self, from: data)
                
            } catch {
                showFileAlert = true
                appError = MyImageError.ErrorType(error: .decodingError)
                
            }
            
        } catch {
            showFileAlert = true
            appError = MyImageError.ErrorType(error: error as! MyImageError)
            
        }
        
    }
    
} // fin
