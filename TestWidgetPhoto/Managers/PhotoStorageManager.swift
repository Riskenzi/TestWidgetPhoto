//
//  PhotoStorageManager.swift
//  TestWidgetPhoto
//
//  Created by Valerii Melnykov on 26.10.2020.
//

import SwiftUI

class PhotoStorageManager {
    
   
    static let shared = PhotoStorageManager()
    
    
    private init() {
   
    }
    
    var refreshInterval: RefreshInterval {
        set(interval) {
            let userDefaults = UserDefaults(suiteName: UserDefoulsKey.photos.rawValue)
            userDefaults!.setValue(interval.rawValue, forKey: SupportKey.kRefreshKey.rawValue)
            userDefaults!.synchronize()
        }
        
        get {
            let userDefaults = UserDefaults(suiteName: UserDefoulsKey.photos.rawValue)
            if let refreshIntervalRaw = userDefaults?.string(forKey: SupportKey.kRefreshKey.rawValue) {
                return RefreshInterval(rawValue: refreshIntervalRaw) ?? .never
            }
            
            return .never
        }
    }
    
    func savePhotos(images: [PhotoModel])  {
        let userDefaults = UserDefaults(suiteName: UserDefoulsKey.photos.rawValue)
        
        let imageNames = images.compactMap({ $0.imageFileName })
        
        userDefaults!.set(imageNames, forKey: SupportKey.kPhoto.rawValue)
        userDefaults!.synchronize()
    }
    
    func loadPhotos() -> [PhotoModel] {
        let userDefaults = UserDefaults(suiteName: UserDefoulsKey.photos.rawValue)
    
        if let photos = userDefaults?.array(forKey: SupportKey.kPhoto.rawValue) {
            return photos.compactMap({ PhotoModel(imageFileName: $0 as? String) })
        }

        return []
    }
    
    func storeImageData(data: NSData, for imageIdentifier: String) {
        let userDefaults = UserDefaults(suiteName: UserDefoulsKey.photos.rawValue)
        userDefaults?.setValue(data, forKey: imageIdentifier)
        userDefaults?.synchronize()
    }
    
    func retriveImageData(key: String) -> Data? {
        let userDefaults = UserDefaults(suiteName: UserDefoulsKey.photos.rawValue)
        if let data = userDefaults?.data(forKey: key) {
            return data
        }
        return nil
    }
}


