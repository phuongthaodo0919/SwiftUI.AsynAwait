//
//  CustomButtonModifier.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 6/4/23.
//

import Foundation
import SwiftUI

struct CustomButtonModifier: ViewModifier {
    
    var font: Font = .title
    
    func body(content: Content) -> some View {
        return content
            .font(font)
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(20)
            .shadow(radius: 10)
    }
}

extension View {
    func customButtonModifier(font: Font = .title) -> some View {
        modifier(CustomButtonModifier(font: font))
    }
}
