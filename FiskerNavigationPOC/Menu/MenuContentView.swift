//
//  MenuContentView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/13/22.
//

import SwiftUI


struct MenuContentView: View {    
    var onMenuItemSelected: (MenuItemType?) -> ()
    
    @Environment(\.safeAreaInsets) var safeAreaInsets
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Button {
                    onMenuItemSelected(nil)
                } label: {
                    HStack {
                        Text("Close")
                            .font(.title)
                        Spacer()
                    }
                }
                .frame(
                    width: geometry.size.width
                )
                .background(Color.purple)
                
                
                Text("")
                
                Button {
                    onMenuItemSelected(.Account)
                } label: {
                    HStack {
                        Text("Account")
                            .font(.title)
                        Spacer()
                    }
                }
                
                Button {
                    onMenuItemSelected(nil)
                } label: {
                    Text("Home")
                        .font(.title)
                }
                
                Button {
                    print("Discover")
                } label: {
                    Text("Discover")
                        .font(.title)
                }
                
                Button {
                    onMenuItemSelected(.MyFisker)
                } label: {
                    Text("My Fisker")
                        .font(.title)
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, safeAreaInsets.top + 20)
            .padding(.bottom, safeAreaInsets.bottom + 20)
        }
    }
}

struct MenuContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuContentView() { selectedMenuItemType in
            if let selectedMenuItemType = selectedMenuItemType {
                print("menu selected: \(selectedMenuItemType.rawValue)")
            }
        }
    }
}
