//
//  CarDetailsView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/12/22.
//

import SwiftUI

struct CarDetailsView: View {
    @EnvironmentObject var homeViewModel: HomeView.ViewModel
    
    var body: some View {
        VStack {
            Text("Car Details View")
            
            NavigationLink(destination: CarDetailDetailsView().environmentObject(homeViewModel)) {
                Text("go to Details Details")
            }
        }
        .fiskerToolbar(title: "Car Details", showMenu: true)
    }
}

struct CarDetailDetailsView: View {
    
    @EnvironmentObject var homeViewModel: HomeView.ViewModel
    
    var body: some View {
        VStack {
            Text("Car Detail Details View")
            Button {
                homeViewModel.resetNavigationAnimated()
            } label: {
                Text("Go to home")
            }

        }
        .fiskerToolbar(title: "Fisker", showMenu: true)
    }
}

struct CarDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CarDetailsView()
        }
    }
}
