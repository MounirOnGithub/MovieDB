//
//  ContentView.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 31/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CategoryListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData(favouriteMovieIds: []))
    }
}
