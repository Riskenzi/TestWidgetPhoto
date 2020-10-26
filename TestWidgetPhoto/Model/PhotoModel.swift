//
//  PhotoModel.swift
//  PhotoWidgetDemo
//
//  Created by Valerii Melnykov on 26.10.2020.
//

import SwiftUI

class PhotoModel: NSObject, Identifiable {
    
    let id = UUID()
    var image: Image? = nil
    var imageFileName: String? = nil
    
    init(imageFileName: String?) {

        self.imageFileName = imageFileName
        
        if image == nil && imageFileName != nil {
            self.image = Image(uiImage: UIImage(data: PhotoStorageManager.shared.retriveImageData(key: imageFileName!)!)!)
        }
    }
}
