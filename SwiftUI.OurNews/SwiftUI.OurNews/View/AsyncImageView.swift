//
//  AsyncImageView.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/25/23.
//

import SwiftUI

struct AsyncImageView: View {
    var imageUrl: String
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { result in
            switch result {
            case .success(let image):
                image.resizable()
            case .failure( _):
                Image(systemName: "photo.artframe")
                .resizable()
            case .empty:
                Image(systemName: "photo.artframe")
                .resizable()
            @unknown default:
                Image(systemName: "photo.artframe")
                .resizable()
            }
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(imageUrl: "https://live-production.wcms.abc-cdn.net.au/80c7fd8e780bcaa4cddfa095c6fdf2a1?impolicy=wcms_crop_resize&cropH=1080&cropW=1920&xPos=0&yPos=0&width=862&height=485")
    }
}
