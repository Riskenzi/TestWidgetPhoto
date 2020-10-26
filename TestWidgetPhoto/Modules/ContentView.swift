//
//  ContentView.swift
//  PhotoWidgetDemo
//
//  Created by Valerii Melnykov on 26.10.2020.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @State private var photos: [PhotoModel] = PhotoStorageManager.shared.loadPhotos()
    
    @State var selectedPhoto: Image? = nil
    @State var showCaptureImageView: Bool = false
    @State var showSettingsView: Bool = false
    @State var isEditMode: Bool = false
    @State var refreshInterval: RefreshInterval = PhotoStorageManager.shared.refreshInterval
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func deleteAction(gridItem: PhotoViewItem) {
        if let index = photos.firstIndex(where: { gridItem.image == $0.image }) {
            photos.remove(at: index)
        }
    }
    
    var gearButton: some View {
        Button(action: {
            showSettingsView.toggle()
        }) {
            Image(systemName: "gear")
        }
    }
    
    var applyButton: some View {
        Button("Apply",  action: {
          
            isEditMode.toggle()
            
            PhotoStorageManager.shared.savePhotos(images: photos)
            WidgetCenter.shared.reloadAllTimelines()
        })
    }
    
    var addImageButton: some View {
        Button(action: {
            self.showCaptureImageView.toggle()
        })
        {
            Image(systemName: "plus.circle")
                .font(.largeTitle)
                .padding()
        }
    }
    
    
    func navItems() -> some View {
        return Group {
            if self.isEditMode {
                applyButton
            }
            else {
                NavigationLink(
                    destination: SettingsView(refreshInterval: $refreshInterval),
                    isActive: $showSettingsView,
                    label: {
                        gearButton
                    })
            }
        }
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                    ScrollView {
                            VStack {
                                LazyVGrid(columns: layout, spacing: 20) {
                                    ForEach(photos) { item in
                                        PhotoViewItem(image: item.image!,
                                                      editMode: $isEditMode,
                                                      deleteAction: { item in
                                                        self.deleteAction(gridItem: item)
                                                      })
                                    }
                                }
                                .padding(.horizontal)
                                
                                addImageButton
                            }.padding(.top, 20)
                    }
                    .navigationBarTitle("Photo Widget", displayMode: .inline)
                    .navigationBarItems(leading:
                                            Button("Edit", action: {
                                                self.isEditMode.toggle()
                                            }),
                                        trailing: navItems())
            }
            
            if showCaptureImageView {
                ImagePickerTool(isShown: $showCaptureImageView) { image, imageName in
                    
                    guard let imageName = imageName else { return }
                    photos.append(PhotoModel(imageFileName: imageName))
                    
                    PhotoStorageManager.shared.savePhotos(images: photos)
                    
                    WidgetCenter.shared.reloadAllTimelines()
                }
            }
        }
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
