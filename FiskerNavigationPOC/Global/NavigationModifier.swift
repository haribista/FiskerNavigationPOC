//
//  NavigationModifier.swift
//  Fisker
//
//  Created by Kiavash Faisali on 10/26/22.
//

import SwiftUI

struct NavigationModifier: ViewModifier {
    var showBackButton = true
    var title: String
    var showMenu = true
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                NavigationToolbar(showBackButton: showBackButton, title: title, showMenu: showMenu)
            }
    }
}
