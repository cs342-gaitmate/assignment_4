//
//  AboutStudyViewText.swift
//  CardinalKit_Example
//
//  Created by Laura on 01.03.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI

struct AboutStudyViewText: View {
    
    let color: Color
    let config = CKConfig.shared
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        
        /*
        let gradient = Gradient(colors: [.white, color])
        
        LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading)
            .edgesIgnoringSafeArea(.vertical)
            .overlay (
         */
                
        VStack (alignment: .leading, spacing: 20){
            
            Spacer()
            
            Text("About GaitMate")
                    .font(.title)
                    .padding(.leading,30)
                    //.foregroundColor(Color.blue)
            
                
            Text("Remotely Identifying Temporal Risk for Falls")
                    //.font(.system(size: 12, weight: .light))
                        .italic()
                    .padding(30)
            
            //Spacer()
            
            Image("walking_man")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN*2)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN*2)
                
            Text("GaitMate is an app to assess the risk of falls in older adults. The idea for the app was created by the two Stanford clinicians Brian Suffoletto and David Kim, who have conducted research on this topic for several years. Together with a team of students from the Stanford Byers Center for Biodesign the idea was brought to life. By using this app and participating in this study you are contributing to fall prevention. We thank you very much for your commitment and time! If you have further questions about this project feel free to reach out.")
                    .font(.system(size: 13))
                    .padding(30)
            
            Spacer()
            
        }//)
    }
}

struct AboutStudyViewText_Previews: PreviewProvider {
    static var previews: some View {
        AboutStudyViewText(color: Color.blue)
    }
}
