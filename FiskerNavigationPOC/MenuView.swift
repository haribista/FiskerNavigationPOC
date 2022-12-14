//
//  MenuView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI


struct MenuView: View {
    private let offset: CGFloat = 80
    
    @Binding var showMenu: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                GeometryReader { _ in
                    EmptyView()
                }
                .background(Color.black.opacity(0.65))
                .opacity(showMenu ? 1.0 : 0.0)
                .animation(.default)
                .onTapGesture {
                    showMenu.toggle()
                }
                
                HStack {
                    MenuContentView(showMenu: $showMenu)
                        .frame(width: geometry.size.width - offset)
                        .background(Color.white)
                        .offset(x: showMenu ? offset : geometry.size.width)
                        .animation(.default)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    @State static var showMenu = true
    static var previews: some View {
        MenuView(showMenu: $showMenu)
    }
}
