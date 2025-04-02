//
//  ContentView.swift
//  InstagramClone
//
//  Created by Youssef Ashraf on 02/04/2025.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject private var user = UserViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    UserProfileView()
}
