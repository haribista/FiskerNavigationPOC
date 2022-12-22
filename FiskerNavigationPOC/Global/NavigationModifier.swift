//
//  NavigationModifier.swift
//  Fisker
//
//  Created by Kiavash Faisali on 10/26/22.
//

import SwiftUI

struct NavigationModifier: ViewModifier {
    var title: String
    var showMenu = true
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                NavigationToolbar(title: title, showMenu: showMenu)
            }
    }
}
