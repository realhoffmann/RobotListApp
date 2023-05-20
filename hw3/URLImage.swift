//
//  URLImage.swift
//  hw3
//
//  Created by Julian Hoffmann on 20.05.23.
//

import SwiftUI

struct URLImage: View {
    @State private var imageData: Data? = nil
    let url: String

    var body: some View {
        Group {
            if let data = imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
            }
        }
        .onAppear(perform: fetchImage)
    }

    private func fetchImage() {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error downloading image data: \(error?.localizedDescription ?? "No error description.")")
                return
            }

            DispatchQueue.main.async {
                imageData = data
            }
        }.resume()
    }
}
