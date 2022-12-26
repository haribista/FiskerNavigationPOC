//
//  ContentView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI

struct HomeView: View {
    @State var showMenu = false
    
    @State private var showAccount = false
    @State private var showMyFisker = false
    
    func resetNavigation() {
        showAccount = false
        showMyFisker = false
    }
    
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
                    
                    NavigationLink(isActive: $showAccount) {
                        AccountView()
                    } label: {}
                    
                    NavigationLink(isActive: $showMyFisker) {
                        MyFiskerView()
                    } label: {}
                }
            }
            
            MenuView(showMenu: showMenu) { selectedMenuItemType in
                UINavigationBar.setAnimationsEnabled(false)
                resetNavigation()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    UINavigationBar.setAnimationsEnabled(true)
                    self.showMenu = false
                    
                    let animationDuration: Double = 0.40
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        if let selectedMenuItemType = selectedMenuItemType {
                            switch selectedMenuItemType {
                            case .MyFisker:
                                self.showMyFisker = true
                            case .Account:
                                self.showAccount = true
                            }
                        } else {
                            
                        }
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
