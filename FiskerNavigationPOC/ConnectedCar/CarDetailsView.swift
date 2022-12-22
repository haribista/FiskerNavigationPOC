//
//  CarDetailsView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/12/22.
//

import SwiftUI

struct CarDetailsView: View {
    var body: some View {
        VStack {
            Text("Car Details View")
            
            NavigationLink(destination: CarDetailDetailsView()) {
                Text("go to Details Details")
            }
        }
        .fiskerToolbar(title: "Car Details", showMenu: true)
    }
}

struct CarDetailDetailsView: View {
    var body: some View {
        Text("Car Detail Details View")
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
