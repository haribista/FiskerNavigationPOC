//
//  ContentView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI

enum TabItemType {
    case connectedCar
    case feed
    case discover
}

struct HomeView: View {
    @StateObject var viewModel: ViewModel
    @State var selectedTab = TabItemType.feed

    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    TabView(selection: $selectedTab) {
                        ConnectedCarView()
                            .environmentObject(viewModel)
                            .tabItem {
                                Label("Car", systemImage: "tray.and.arrow.down.fill")
                            }
                            .tag(TabItemType.connectedCar)
                        FeedView()
                            .tabItem {
                                Label("Feed", systemImage: "tray.and.arrow.up.fill")
                            }
                            .tag(TabItemType.feed)
                         
                        DiscoverView()
                            .tabItem {
                                Label("Discover", systemImage: "person.crop.circle.fill")
                            }
                            .tag(TabItemType.discover)
                    }
                    .onMenuToggleNotification {
                        viewModel.showMenu = true
                    }
                    
                    NavigationLink(isActive: $viewModel.showAccount) {
                        AccountView()
                    } label: {}
                    
                    NavigationLink(isActive: $viewModel.showMyFisker) {
                        MyFiskerView()
                    } label: {}
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                                        
                    ToolbarItem(placement: .principal) {
                        Button {
                            
                        } label: {
                            if selectedTab == .feed {
                                Text("View All")
                            } else {
                                Text("")
                            }
                        }
                    }

                    ToolbarItem(placement: .navigationBarTrailing) {
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
            .navigationViewStyle(.stack)
            
            MenuView(showMenu: viewModel.showMenu) { selectedMenuItemType in
                viewModel.onMenuItemSelected(with: selectedMenuItemType)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeView.ViewModel())
    }
}
