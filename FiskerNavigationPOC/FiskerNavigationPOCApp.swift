//
//  FiskerNavigationPOCApp.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI

private struct SafeAreaInsetsEnvironmentKey: EnvironmentKey {
    static let defaultValue: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
}

extension EnvironmentValues {
    var safeAreaInsets: EdgeInsets {
        get { self[SafeAreaInsetsEnvironmentKey.self] }
        set { self[SafeAreaInsetsEnvironmentKey.self] = newValue }
    }
}

@main
struct FiskerNavigationPOCApp: App {
    
    @State private var safeAreaInsets: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
//    init() {
//        UITextView.appearance().backgroundColor = .clear
//
//        UITabBar.appearance().backgroundImage = UIImage()
//        UITabBar.appearance().shadowImage = UIImage()
//        UITabBar.appearance().clipsToBounds = true
//
//        UINavigationBar.appearance().backgroundColor = .clear
//        UINavigationBar.appearance().barTintColor = .clear
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
//        UINavigationBar.appearance().shadowImage = UIImage()
//
//        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "Back_Sml")
//        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "Back_Sml")
//    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                GeometryReader { geometry in
                    Color.clear.onAppear {
                        safeAreaInsets = geometry.safeAreaInsets
                    }
                }
                
                HomeView()
                    .environment(\.safeAreaInsets, safeAreaInsets)
            }
        }
    }
}
