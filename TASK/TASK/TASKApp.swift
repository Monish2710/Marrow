//
//  TASKApp.swift
//  TASK
//
//  Created by Monish Kumar on 12/04/25.
//

import SwiftUI

@main
struct TASKApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

#Preview {
    ContentView()
}
