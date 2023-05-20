//
//  UserDetailView.swift
//  hw3
//
//  Created by Julian Hoffmann on 20.05.23.
//

import SwiftUI
struct UserDetailView: View {
    let user: UserItem

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("ID: \(user.id)")
            Text("Name: \(user.first_name + " " + user.last_name)")
            Text("Description: \(user.employment.title)")
            Text("Skill: \(user.employment.key_skill)")
            Text("URLImage: \(user.avatar)")
            URLImage(url: user.avatar)
        }
        .bold()
        .padding()
        .navigationBarTitle(user.first_name, displayMode: .inline)
    }
}

