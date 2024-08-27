//
//  CustomModifiers.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 1/8/24.
//

import Foundation
import SwiftUI

struct ButtonPress: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({_ in
                        onPress()
                    })
                    .onEnded({_ in
                        onRelease()
                    })
            )
    }
}

extension View {
    func pressEvents(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(ButtonPress(onPress: { onPress() }, onRelease: { onRelease() }))
    }
}

struct customViewModifier: ViewModifier {
    var roundedCorners: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCorners)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCorners)
                .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(.custom("Open Sane", size: 18))
            .shadow(radius: 10)
    }
}
