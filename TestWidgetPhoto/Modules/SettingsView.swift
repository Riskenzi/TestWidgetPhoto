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
            
            Section(header: Text("WIDGET SETTINGS")) {
                Picker("Photo Refresh Interval", selection: $refreshInterval) {
                    ForEach(RefreshInterval.allCases) { i in
                        Text(i.rawValue).tag(i)
                    }
                }
                
                Button("Sync widget settings") {
                    PhotoStorageManager.shared.refreshInterval = refreshInterval
                    
                    WidgetCenter.shared.reloadAllTimelines()
                }
                
            }
            
            Section(header: Text("APP INFO")) {
                
                NavigationLink(
                    destination: Text("How to use screen"),
                    label: {
                        Text("How to use")
                    })
                
                HStack {
                    Text("App Version")
                    Spacer()
                    Text("1.0.0")
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
