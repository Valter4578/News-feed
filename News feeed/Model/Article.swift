//
//  Article.swift
//  News feeed
//
//  Created by Максим Алексеев on 28.12.2019.
//  Copyright © 2019 Максим Алексеев. All rights reserved.
//

import Foundation

struct Article: Codable {
    var source: Source
    var author: String?
    var title: String
    var description: String
    var url: URL
    var urlToImage: URL?
    var content: String
    
    enum codingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case content
    }
}

struct Source: Codable {
    var name: String
    
}

struct Articles: Codable {
    var articles: [Article]?
}
