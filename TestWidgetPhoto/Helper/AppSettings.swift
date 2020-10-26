//
//  AppSettings.swift
//  PhotoWidgetDemo
//
//  Created by Valerii Melnykov on 26.10.2020.
//

import SwiftUI


public enum RefreshInterval: String, CaseIterable, Identifiable {
    case oneMinute = "1 minute"
    case twoMinute = "2 minute"
    case threeMinute = "3 minute"
    case fourMinute = "4 minute"
    case fiveMins    = "5 minutes"
    
    
    
    public var id: String { self.rawValue }
    
    var minutesInterval : Int {
        switch self {
        case .oneMinute:
            return 1
        case .twoMinute:
            return 2
        case .threeMinute:
            return 3
        case .fourMinute:
            return 4
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
