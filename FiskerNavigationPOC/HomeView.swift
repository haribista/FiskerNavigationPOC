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
            .navigationTitle("Fisker")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct DiscoverView: View {
    var body: some View {
        Text("DiscoverView")
    }
}

struct HomeView: View {
    
    @State var showMenu = false
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
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
            }
            
            if showMenu {
                MenuView(showMenu: $showMenu)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
