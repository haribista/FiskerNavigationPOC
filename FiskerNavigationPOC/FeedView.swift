//
//  FeedView.swift
//  FiskerNavigationPOC
//
//  Created by Hari Krishna Bista on 12/21/22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack {
            Text("FeedView")
            Text("FeedView")
        }
        .navigationBarItems(
            leading:
                Button("Leading") {
                print("leading")
            },
            trailing:
                Button("Trailing") {
                    print("leading")
                }
        )
        .onAppear {
            print("FeedView")
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
