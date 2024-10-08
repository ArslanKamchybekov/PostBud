//
//  ContentView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                TabBarView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}

