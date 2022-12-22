//
//  AccountView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/14/22.
//

import SwiftUI

struct AccountDetailsView: View {
    var body: some View {
        Text("Acount Details view.")
            .fiskerToolbar(title: "Acount Details view", showMenu: true)
    }
}

struct AccountView: View {
    
    @State var showAccountDetailsView = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            Text("Acount View")
                .font(.title)
            
            Spacer()
            
            Spacer()
            
            Button {
                showAccountDetailsView = true
            } label: {
                Text("go Acount Details View")
                    .font(.title)
            }
            
            Spacer()
            
            NavigationLink(isActive: $showAccountDetailsView) {
                AccountDetailsView()
            } label: {}
        }
        .padding(30)
        .fiskerToolbar(title: "Account View", showMenu: true)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
