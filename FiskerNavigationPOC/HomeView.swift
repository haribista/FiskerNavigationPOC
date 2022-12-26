//
//  ContentView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI

extension HomeView {
    @MainActor class ViewModel: ObservableObject {
        @Published var showMenu = false
        
        @Published var showAccount = false
        @Published var showMyFisker = false
        @Published var showCarDetailsView = false
        
        func resetNavigation(with completion:@escaping () -> Void) {
            UINavigationBar.setAnimationsEnabled(false)
            showAccount = false
            showMyFisker = false
            showCarDetailsView = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                UINavigationBar.setAnimationsEnabled(true)
                completion()
            }
        }
        
        func onMenuItemSelected(with selectedMenuItemType: MenuItemType?) {
            if let selectedMenuItemType = selectedMenuItemType {
                // Step 1: reset navigation
                resetNavigation {
                    // step 2: hide menu with animation
                    self.showMenu = false
                    
                    // step 3: when hide menu animation completes, navigate to destination
                    let animationDuration: Double = 0.4
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        switch selectedMenuItemType {
                        case .MyFisker:
                            self.showMyFisker = true
                        case .Account:
                            self.showAccount = true
                        }
                    }
                }
            } else {
                showMenu = false
            }
        }
    }
}

struct HomeView: View {

    @StateObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    TabView {
                        ConnectedCarView()
                            .environmentObject(viewModel)
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
                        viewModel.showMenu = true
                    }
                    .fiskerToolbar(title: "Fisker", showMenu: true)
                    
                    NavigationLink(isActive: $viewModel.showAccount) {
                        AccountView()
                    } label: {}
                    
                    NavigationLink(isActive: $viewModel.showMyFisker) {
                        MyFiskerView()
                    } label: {}
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
