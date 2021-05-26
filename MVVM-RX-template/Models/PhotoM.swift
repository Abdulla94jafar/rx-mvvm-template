//
//  PhotoM.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/10/20
//

import Foundation



struct PhotoM : Codable {

    let id : String
    let author: String
    let width, height: Int
    let unsplashUrl, downloadURL: String

    internal init(
        id: String,
        author: String,
        width: Int,
        height: Int,
        unsplashUrl: String,
        downloadURL: String
    ) {
        self.id = id
        self.author = author
        self.width = width
        self.height = height
        self.unsplashUrl = unsplashUrl
        self.downloadURL = downloadURL
    }
}

extension PhotoM {
    enum CodingKeys: String, CodingKey {
        case id, author, width, height
        case unsplashUrl = "url"
        case downloadURL = "download_url"
    }
}
