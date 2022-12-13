//
//  TempView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI

struct TempView: View {
    var body: some View {
        NavigationView {
            Text("Temp View")
        }
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MenuContent: View {
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
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    @Binding var showMenu: Bool

    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.75))
            .opacity(showMenu ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                showMenu.toggle()
            }
            
            let menuOffset: CGFloat = 100
            let menuContentWidth = width - menuOffset
            
            HStack {
                MenuContent()
                    .frame(width: menuContentWidth)
                    .background(Color.white)
                    .animation(.default)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView: View {
    @State var showMenu: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if !self.showMenu {
                    Button{
                        showMenu.toggle()
                    } label: {
                        Text("Show Menu")
                    }
                }
                
                SideMenu(width: geometry.size.width, showMenu: $showMenu)
            }
            .background(Color.green)
            .edgesIgnoringSafeArea(.all)
        }
    }
}
