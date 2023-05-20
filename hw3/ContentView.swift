//
//  ContentView.swift
//  hw3
//
//  Created by Julian Hoffmann on 20.05.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = UsersViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    HStack {
                        URLImage(url: user.avatar)
                            .frame(width: 80, height: 80)
                        Text(user.first_name).bold()
                    }
                }
            }
            .toolbar {
                Button(action: viewModel.fetchData) {
                    Image(systemName: "arrow.clockwise")
                    Text("Reload")
                }
            }
            .onAppear {
                if viewModel.users.isEmpty {
                    viewModel.fetchData()
                }
            }
            .navigationBarTitle("Robot List")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}




