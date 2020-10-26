//
//  SettingsView.swift
//  PhotoWidgetDemo
//
//  Created by Valerii Melnykov on 26.10.2020.
//

import SwiftUI
import WidgetKit

struct SettingsView: View {
    
    @Binding var refreshInterval: RefreshInterval
    
    var body: some View {
        Form {
            
            Section(header: Text("SETTINGS")) {
                Picker("Refresh Interval", selection: $refreshInterval) {
                    ForEach(RefreshInterval.allCases) { i in
                        Text(i.rawValue).tag(i)
                    }
                }
                
                Button("Sync") {
                    PhotoStorageManager.shared.refreshInterval = refreshInterval
                    
                    WidgetCenter.shared.reloadAllTimelines()
                }
                
            }
            
        }.navigationBarTitle(Text("Settings"), displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    var refreshInterval: RefreshInterval = .never
    static var previews: some View {
        SettingsView(refreshInterval: .constant(.never))
    }
}
