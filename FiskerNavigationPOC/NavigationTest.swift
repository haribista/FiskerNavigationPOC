//
//  NavigationTest.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/14/22.
//

import SwiftUI

struct NavigationTest: View {
    @State private var selectedMenuItemType: MenuItemType? = nil

    var body: some View {
        NavigationView {
            VStack {
                ForEach(MenuItemType.allCases) { menuItemType in
                    NavigationLink(
                        destination: menuItemType.destinationView(),
                        tag: menuItemType,
                        selection: $selectedMenuItemType
                    ) {
                        EmptyView()
                    }
                }

                Button("My Fisker") {
                    selectedMenuItemType = .MyFisker
                }

                Button("Accccount") {
                    selectedMenuItemType = .Account
                }
            }
        }
    }
}

struct NavigationTest_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTest()
    }
}
