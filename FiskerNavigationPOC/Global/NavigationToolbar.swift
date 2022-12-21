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
    func getSafeAreaTop() -> UIEdgeInsets {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter { $0.isKeyWindow }.first

        return keyWindow?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func fiskerToolbar(
        showBackButton: Bool = true,
        title: String,
        showMenu: Bool = true
    ) -> some View {
        modifier(NavigationModifier(showBackButton: showBackButton, title: title, showMenu: showMenu))
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
    @Environment(\.presentationMode) private var presentationMode
    
    @State var showBackButton = true
    @State var title: String
    @State var showMenu = true

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            if showBackButton {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("Back_Sml")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                }
            }
        }
        
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
