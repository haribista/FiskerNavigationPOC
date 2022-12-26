//
//  ConnectedCarView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/2/22.
//

import SwiftUI

struct ConnectedCarView: View {
    
    @EnvironmentObject var homeViewModel: HomeView.ViewModel

    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            Text("Connected Car View")
                .font(.title)
            
            Spacer()
            
            Spacer()
            
            Button {
                homeViewModel.resetNavigation {
                    homeViewModel.showCarDetailsView = true
                }
            } label: {
                Text("go Car Details View")
                    .font(.title)
            }
            
            Spacer()
            
            NavigationLink(isActive: $homeViewModel.showCarDetailsView) {
                CarDetailsView()
            } label: {}
        }
        .padding(30)
    }
}

struct ConnectedCarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ConnectedCarView()
        }
    }
}
