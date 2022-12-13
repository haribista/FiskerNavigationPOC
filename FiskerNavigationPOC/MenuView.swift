//
//  MenuView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI


struct MenuView: View {
    @Binding var showMenu: Bool
    
    let width: CGFloat
    
    var body: some View {
        ZStack {
            EmptyView()
                .background(Color.gray.opacity(0.3))
                .opacity(showMenu ? 1.0 : 0.0)
                .animation(Animation.easeIn.delay(0.25))
                .onTapGesture {
                    showMenu = false
                }
            
            HStack {
                Spacer()
                
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
                .frame(width: width)
                .background(Color.white)
                .offset(x: showMenu ? 0 : -width)
                .animation(.default)
                .background(Color.red)
            }
            .background(Color.green)
        }
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    @State static var showMenu = true
    static var previews: some View {
        MenuView(showMenu: $showMenu, width: 300)
    }
}
