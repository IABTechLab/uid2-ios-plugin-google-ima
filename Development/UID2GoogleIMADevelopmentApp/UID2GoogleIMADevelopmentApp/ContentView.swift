//
//  ContentView.swift
//  UID2GoogleIMADevelopmentApp
//
//  Created by Brad Leege on 4/11/23.
//

import SwiftUI
import GoogleInteractiveMediaAds

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
