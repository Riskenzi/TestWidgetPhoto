//
//  Naavigation.swift
//  PhotoWidgetDemo
//
//  Created by Valerii Melnykov on 26.10.2020.
//

import SwiftUI
import UIKit

class Navigation:NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var isNavigationActive: Bool
    
    var imageSelected: (Image, String?) -> Void

    init(isShown: Binding<Bool>, imageSelected: @escaping (Image, String?) -> Void) {
        
        _isNavigationActive = isShown
        self.imageSelected = imageSelected
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                  didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
       guard let unwrapImageURL = info[UIImagePickerController.InfoKey.imageURL] as? NSURL else { return }
       
        let fileName = unwrapImageURL.lastPathComponent
        let data = unwrapImage.jpegData(compressionQuality: 0.5)! as NSData
        
        PhotoStorageManager.shared.storeImageData(data:data, for: fileName!)
        self.imageSelected(Image(uiImage: unwrapImage), fileName)
        
        isNavigationActive = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isNavigationActive = false
    }
    
}

