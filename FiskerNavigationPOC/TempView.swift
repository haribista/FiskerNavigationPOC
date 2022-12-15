//
//  TempView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI

struct TempView: View {
    
    @State var selectedMenuItemType: MenuItemType?
    
    @State var items: [Bool] = []
    
    var body: some View {
        NavigationView {
            
//            List(MenuItemType.allCases) { menuItemType in
//
//            }
            
            
//            Text("Hello")
            
            VStack {
                Button {
                    selectedMenuItemType = .MyFisker
                } label: {
                    Text("My Fisker")
                }
                
                Button {
                    selectedMenuItemType = .Account
                } label: {
                    Text("Account")
                }
            }
            
//            ForEach(MenuItemType.allCases) { menuItemType in

            if let selectedMenuItemType = selectedMenuItemType {
                NavigationLink(
                    "",
                    tag: selectedMenuItemType,
                    selection: $selectedMenuItemType
                ) {
                    selectedMenuItemType.destinationView()
                }
            }
        }
        .onAppear {
//            selectedMenuItemType = nil
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                self.selectedMenuItemType = .MyFisker
//            }
        }
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
