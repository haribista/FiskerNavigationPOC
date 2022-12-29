//
//  HomeView+ViewModel.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/29/22.
//

import SwiftUI
extension HomeView {
    @MainActor class ViewModel: ObservableObject {
        @Published var showMenu = false
        
        @Published var showAccount = false
        @Published var showMyFisker = false
        @Published var showCarDetailsView = false
        
        func resetNavigation(with completion: @escaping () -> Void) {
            UINavigationBar.setAnimationsEnabled(false)
            resetNavigationStates()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                UINavigationBar.setAnimationsEnabled(true)
                completion()
            }
        }
        
        func resetNavigationAnimated() {
            resetNavigationStates()
        }
        
        private func resetNavigationStates() {
            showAccount = false
            showMyFisker = false
            showCarDetailsView = false
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
                        case .Home:
                            print("")
                        }
                    }
                }
            } else {
                showMenu = false
            }
        }
    }
}
