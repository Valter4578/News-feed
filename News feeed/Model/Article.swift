//
//  Article.swift
//  News feeed
//
//  Created by Максим Алексеев on 28.12.2019.
//  Copyright © 2019 Максим Алексеев. All rights reserved.
//

import Foundation

struct Article: Codable {
    
    var description: String = ""
    var urlToImage: String? = ""
    var content: String = ""
    
    enum CodingKeys: String, CodingKey {
        case description
        case urlToImage
        case content
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        description = try values.decode(String.self, forKey: .description)
        urlToImage = try values.decode(String.self, forKey: .urlToImage)
        content = try values.decode(String.self, forKey: .content)
        
        
    }
}

struct ArticleDataStore: Codable {

}


