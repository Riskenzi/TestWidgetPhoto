//
//  ImagePicker.swift
//  PhotoWidgetDemo
//
//  Created by Valerii Melnykov on 26.10.2020.
//
import SwiftUI

struct ImagePickerTool {
    
    @Binding var isShown: Bool
    var imageSelected: (Image, String?) -> Void
    
    func makeCoordinator() -> Navigation {
      return Navigation(isShown: $isShown, imageSelected: imageSelected)
    }

}

extension ImagePickerTool: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerTool>) {
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerTool>) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        
        return picker
    }
    
}
