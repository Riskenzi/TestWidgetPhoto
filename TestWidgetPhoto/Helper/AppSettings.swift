//
//  AppSettings.swift
//  PhotoWidgetDemo
//
//  Created by Valerii Melnykov on 26.10.2020.
//

import SwiftUI


public enum RefreshInterval: String, CaseIterable, Identifiable {
    case never       = "never"
    case thirtySecond    = "30 seconds"
    case oneMinute = "1 minute"
    case fiveMins    = "5 minutes"
    
    
    
    public var id: String { self.rawValue }
    
    var minutesInterval : Int {
        switch self {
        case .never:
            return 0
        case .thirtySecond:
            return Int(0.30)
        case .oneMinute:
            return 1
        case .fiveMins:
            return 5
        }
    }
 }


public enum UserDefoulsKey: String {
    case photos = "group.photowidget.demo"
}

public enum SupportKey : String {
    case kPhoto = "photos"
    case kRefreshKey = "refresh_interval"
}
