//
//  ContentView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI

struct HomeView: View {
    @State var showMenu = true

    @State private var selectedMenuItemType: MenuItemType? = nil
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    TabView {
                        ConnectedCarView()
                            .tabItem {
                                Label("Car", systemImage: "tray.and.arrow.down.fill")
                            }
                        FeedView()
                            .tabItem {
                                Label("Feed", systemImage: "tray.and.arrow.up.fill")
                            }
                        DiscoverView()
                            .tabItem {
                                Label("Discover", systemImage: "person.crop.circle.fill")
                            }
                    }
                    .onMenuToggleNotification {
                        showMenu.toggle()
                    }
                    .fiskerToolbar(title: "Fisker", showMenu: true)
                    
                    ForEach(MenuItemType.allCases) { menuItemType in
                        NavigationLink(
                            destination: menuItemType.destinationView(),
                            tag: menuItemType,
                            selection: $selectedMenuItemType
                        ) {
                            EmptyView()
                        }
                    }
                }
            }
            
            MenuView(showMenu: showMenu) { selectedMenuItemType in
                showMenu = false
                let animationDuration: Double = 0.35
                // waiting for menu animation to finish before navigating to other destination
                if let selectedMenuItemType = selectedMenuItemType {
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        self.selectedMenuItemType = selectedMenuItemType
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
