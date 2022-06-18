//
//  DirectoryApp.swift
//  Directory
//
//  Created by Mark Perkins on 6/18/22.
//

import SwiftUI

struct DirectoryApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
        }
    }
}
