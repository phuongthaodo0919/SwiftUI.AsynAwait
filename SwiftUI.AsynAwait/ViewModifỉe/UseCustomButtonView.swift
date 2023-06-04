//
//  UseCustomButtonView.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 6/4/23.
//

import SwiftUI

struct UseCustomButtonView: View {
    var body: some View {
        VStack {
            Text("Hello, I'm text field")
                .customButtonModifier(font: .largeTitle)
            
            Button("Click me button") {
                
            }
            .customButtonModifier(font: .caption)
        }
        
        
    }
}

struct UseCustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        UseCustomButtonView()
    }
}
