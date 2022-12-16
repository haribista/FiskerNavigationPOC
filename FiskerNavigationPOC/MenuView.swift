//
//  MenuView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI

enum MenuItemType: Int, Hashable, CaseIterable, Identifiable {
    case MyFisker
    case Account
    
    var id: Int {
        rawValue
    }
    
    @ViewBuilder @MainActor
    func destinationView() -> some View {
        switch self {
        case .MyFisker:
            MyFiskerView()
        case .Account:
            AccountView()
        }
    }
}

struct MenuView: View {
    var showMenu: Bool
    
    var onMenuItemSelected: (MenuItemType?) -> ()
    
    private let offset: CGFloat = 80
    
    private let animationDuration: Double = 0.35
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                GeometryReader { _ in
                    EmptyView()
                }
                .background(Color.black)
                .opacity(showMenu ? 0.8 : 0.0)
                .animation(.easeIn(duration: animationDuration))
                .onTapGesture {
                    onMenuItemSelected(nil)
                }
                
                HStack {
                    MenuContentView(onMenuItemSelected: onMenuItemSelected)
                    .frame(width: geometry.size.width - offset)
                    .background(Color.white)
                    .offset(x: showMenu ? offset : geometry.size.width)
                    .animation(.default)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(showMenu: true) { menuItemType in
            if let menuItemType = menuItemType {
                print("\(menuItemType.rawValue)")
            }
        }
    }
}
