//
//  TempSlideMenu.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/13/22.
//

import SwiftUI

struct TempMenuContent: View {
    var body: some View {
        List {
            Text("My Profile").onTapGesture {
                print("My Profile")
            }
            Text("Posts").onTapGesture {
                print("Posts")
            }
            Text("Logout").onTapGesture {
                print("Logout")
            }
            .background(Color.red)
        }
    }
}

struct TempSlideMenu: View {
    private let offset: CGFloat = 100
    
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
                .edgesIgnoringSafeArea(.all)
                
                HStack {
                    TempMenuContent()
                        .frame(width: geometry.size.width - offset)
                        .background(Color.white)
                        .offset(x: showMenu ? offset : geometry.size.width)
                        .animation(.default)
                    
                    Spacer()
                }
            }
        }
    }
}

struct TempContentView: View {
    @State var showMenu: Bool = true
    
    var body: some View {
        ZStack {
            Button {
                showMenu.toggle()
            } label: {
                Text("................. Show Menu ....... ............ ")
                    .foregroundColor(Color.white)
            }
            
            TempSlideMenu(showMenu: $showMenu)
        }
        .background(Color.red)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TempContentView_Previews: PreviewProvider {
    static var previews: some View {
        TempContentView()
    }
}
