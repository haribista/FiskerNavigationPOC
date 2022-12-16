//
//  MenuContentView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/13/22.
//

import SwiftUI

struct MenuContentView: View {
    
    var onMenuItemSelected: (MenuItemType?) -> ()
   
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            Text("")
            
            Button {
                onMenuItemSelected(nil)
            } label: {
                Text("Close")
                    .font(.title)
            }
            
            Text("")
            
            Button {
                onMenuItemSelected(.Account)
            } label: {
                Text("Account")
                    .font(.title)
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
