//
//  MenuView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI

enum MenuItemType {
    case MyFisker
    case Account
    case Home
}

struct MenuView: View {
    private let contenOffset: Double = 80
    private let animationDuration: Double = 0.35
    private let backgroundOpacity: Double = 0.8
    
    var showMenu: Bool
    var onMenuItemSelected: (MenuItemType?) -> ()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .opacity(showMenu ? 0.8 : 0.0)
                    .animation(.easeIn(duration: animationDuration))
                    .onTapGesture {
                        onMenuItemSelected(nil)
                    }
                
                MenuContentView(onMenuItemSelected: onMenuItemSelected)
                    .frame(width: geometry.size.width - contenOffset)
                    .background(Color.white)
                    .offset(x: showMenu ? contenOffset : geometry.size.width)
                    .animation(.default)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(showMenu: true) { menuItemType in
            if let menuItemType = menuItemType {
                print("\(menuItemType)")
            }
        }
    }
}
