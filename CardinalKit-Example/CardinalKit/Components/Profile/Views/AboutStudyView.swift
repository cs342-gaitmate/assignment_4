//
//  AboutStudyView.swift
//  CardinalKit_Example
//
//  Created by Laura on 01.03.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI

struct AboutStudyView: View {
    @State private var showPreview = false
    let color: Color
    
    var body: some View {

        HStack {
            
        Text("About GaitMate")
    
        Spacer()
    
        Text("›")
    
            }.frame(height: 60)
                .contentShape(Rectangle())
                .gesture(TapGesture().onEnded({
                    self.showPreview.toggle()
                })).sheet(isPresented: $showPreview, onDismiss: {
                    
                }, content: {
                    AboutStudyViewText(color: Color.blue);
                })
    }
}

struct AboutStudyView_Previews: PreviewProvider {
    static var previews: some View {
        AboutStudyView(color: Color.blue)
    }
}
