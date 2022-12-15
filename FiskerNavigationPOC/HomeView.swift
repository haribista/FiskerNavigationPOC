//
//  ContentView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        Text("FeedView")
    }
}

struct CarDetailDetailsView: View {
    var body: some View {
        Text("Car Detail Details View")
            .fiskerToolbar(showBackButton: true, title: "Fisker", showMenu: true)
    }
}

struct DiscoverView: View {
    var body: some View {
        Text("DiscoverView")
    }
}

struct HomeView: View {
    @State var showMenu = false

    @State private var selectedMenuItemType: MenuItemType? = nil
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack(alignment: .top) {
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
                    .fiskerToolbar(showBackButton: false, title: "Fisker", showMenu: true)
                    
                    MenuView(showMenu: $showMenu)
                    
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
            .onAppear {
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
