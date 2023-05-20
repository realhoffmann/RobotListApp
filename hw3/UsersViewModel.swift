//
//  UsersViewModel.swift
//  hw3
//
//  Created by Julian Hoffmann on 20.05.23.
//

import SwiftUI
class UsersViewModel: ObservableObject {
    @Published var users = [UserItem]()

    func fetchData() {
        guard let url = URL(string: "https://random-data-api.com/api/v2/users?size=10") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let decodedData = try? JSONDecoder().decode([UserItem].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = decodedData.sorted(by: { $0.first_name < $1.first_name })
                    }
                }
            }
        }.resume()
    }
}

