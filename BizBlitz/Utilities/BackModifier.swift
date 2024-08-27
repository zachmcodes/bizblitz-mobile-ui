//
//  BackModifier.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/22/24.
//

import Foundation
import SwiftUI

var BackModifier: some ToolbarContent {
    ToolbarItem(placement: .navigationBarLeading) {
        Button(action: {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let navigationController = windowScene.windows.first?.rootViewController as? UINavigationController {
                    navigationController.popViewController(animated: true)
                }
            }
        }) {
            HStack {
                Image(systemName: "arrow.left")
                Text("Back")
            }
        }
    }
}
