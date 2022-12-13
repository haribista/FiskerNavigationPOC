//
//  MenuView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
            }
            
            Button {
                showMenu = false
            } label: {
                Text("Close")
                    .font(.title)
            }
            
            Text("")
            
            Text("Sign In")
                .font(.title)
            
            Text("Home")
                .font(.title)
            
            Text("My Fisker")
                .font(.title)
            
            Text("Legal")
                .font(.title)
            
            Text("Gear")
                .font(.title)
            
            Text("FAQ")
                .font(.title)
            
            Spacer()
        }
        .padding(20)
        .background(Color.green)
        .offset(x: 120)
        .edgesIgnoringSafeArea(.all)
    }
}
