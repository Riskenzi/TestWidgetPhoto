//
//  PhotoViewItem.swift
//  PhotoWidgetDemo
//
//  Created by Valerii Melnykov on 26.10.2020.
//

import SwiftUI

struct PhotoViewItem: View, Identifiable {
    var id = UUID()
    
    @State var image: Image? = nil
    @Binding var editMode: Bool

    var deleteAction: (PhotoViewItem) -> Void
    
    var body: some View {
        ZStack {
            image?
                .resizable()
                .frame(minWidth: 0, maxWidth: 150, minHeight: 150, maxHeight: 150)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
            
            if editMode {
            VStack() {
                Button(action: {
                    self.deleteAction(self)
                }) {
                    Image.init("delete_icon").font(.largeTitle).padding()
                }
                .padding()
                .buttonStyle(CustomButton(fadeOnPress: false))
                .foregroundColor(.black)
                .opacity(0.5)
                Spacer()
            }.frame(maxWidth: .infinity, alignment:.leading)
            }
        }
        .frame(minWidth: 150, maxWidth: 150, maxHeight: 150)
    }
    
}


struct GridImageView_Previews : PreviewProvider {
    @State private static var editMode = false
    static var previews: some View {
        PhotoViewItem(image: Image("Image"), editMode: $editMode, deleteAction: { item in
            
        })
    }
}

