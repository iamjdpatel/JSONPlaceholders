//
//  ImageViewContainer.swift
//  JSONPlaceholder
//
//  Created by JD Patel on 13/04/20.
//  Copyright © 2020 JD. All rights reserved.
//

import SwiftUI

struct ImageViewContainer: View {
    
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    
    var body: some View {
        VStack {
            Image(uiImage: imageLoader.dataIsValid ? imageFromData(imageLoader.data!) : UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(30)
                .padding([.top, .bottom, .trailing], 8)
            
        }
    }
    
}

class ImageLoader: ObservableObject {
    
    @Published var dataIsValid = false
    
    var data: Data?
    
    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.dataIsValid = true
                self.data = data
            }
        }
        task.resume()
    }
}

// ImageView

func imageFromData(_ data:Data) -> UIImage {
    UIImage(data: data) ?? UIImage()
}

