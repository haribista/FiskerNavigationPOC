//
//  NavigationToolbar.swift
//  Fisker
//
//  Created by Kiavash Faisali on 10/26/22.
//

import SwiftUI
import UIKit

extension Notification {
    static let menuToggleNotification = Notification.Name("menuToggleNotification")
}

extension View {
    
    func fiskerToolbar(
        title: String,
        showMenu: Bool = true
    ) -> some View {
        modifier(NavigationModifier(title: title, showMenu: showMenu))
    }
    
    func fiskerToolbarExtra(
        title: String,
        showMenu: Bool = true
    ) -> some View {
        modifier(NavigationModifierExtra(title: title, showMenu: showMenu))
    }
    
    func onNotification(
        _ notificationName: Notification.Name,
        perform action: @escaping () -> Void
    ) -> some View {
        onReceive(NotificationCenter.default.publisher(
            for: notificationName
        )) { _ in
            action()
        }
    }

    func onMenuToggleNotification(
        perform action: @escaping () -> Void
    ) -> some View {
        onNotification(
            Notification.menuToggleNotification,
            perform: action
        )
    }
}

struct NavigationToolbar: ToolbarContent {
    @State var title: String
    @State var showMenu = true

    var body: some ToolbarContent {
        
        ToolbarItem(placement: .principal) {
            Text(title)
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            if showMenu {
                Button {
                    NotificationCenter.default.post(name: Notification.menuToggleNotification, object: nil)
                } label: {
                    Image("Menu_Sml")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct NavigationToolbarExtra: ToolbarContent {
    @State var title: String
    @State var showMenu = true

    var body: some ToolbarContent {
        
        ToolbarItem(placement: .principal) {
            Text(title)
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            if showMenu {
                Button {
                    NotificationCenter.default.post(name: Notification.menuToggleNotification, object: nil)
                } label: {
                    Image("Menu_Sml")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct NavigationToolbar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CarDetailsView()
        }
    }
}
