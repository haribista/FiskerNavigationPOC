//
//  MenuContentView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/13/22.
//

import SwiftUI

struct MenuContentView: View {
    @Binding var showMenu: Bool
   
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            Text("")
            
            Button {
                withAnimation {
                    showMenu = false
                }
            } label: {
                Text("Close")
                    .font(.title)
            }
            
            Text("")
            
            Button {
                print("show account.")
            } label: {
                Text("Account")
                    .font(.title)
            }
            
            Button {
                print("show Home")
            } label: {
                Text("Home")
                    .font(.title)
            }
            
            Button {
                print("show Home")
            } label: {
                Text("Discover")
                    .font(.title)
            }
            
            Button {
                print("show My Fisker")
            } label: {
                Text("My Fisker")
                    .font(.title)
            }
            
            Spacer()
        }
    }
}

struct MenuContentView_Previews: PreviewProvider {
    @State static var showMenu = true
    static var previews: some View {
        MenuContentView(showMenu: $showMenu)
    }
}
