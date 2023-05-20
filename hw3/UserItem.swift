//
//  UserItem.swift
//  hw3
//
//  Created by Julian Hoffmann on 20.05.23.
//

import SwiftUI
struct UserItem: Codable, Identifiable {
    let id: Int
    let first_name: String
    let last_name: String
    let avatar: String
    let employment: Employment

    struct Employment: Codable {
        let title: String
        let key_skill: String
    }
}

