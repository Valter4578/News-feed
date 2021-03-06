//
//  ArticlesTypes.swift
//  News feeed
//
//  Created by Максим Алексеев on 02.01.2020.
//  Copyright © 2020 Максим Алексеев. All rights reserved.
//

import UIKit

struct ArticlesTopics {
    var topics = ["Bitcoin", "Business", "Apple", "TechCrunch", "The wall street journal"]
    var urlsString = ["https://newsapi.org/v2/everything?q=bitcoin&from=2019-12-08&sortBy=publishedAt&apiKey=30975cb1a464494fa422fbded2862226",
                      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=30975cb1a464494fa422fbded2862226",
                      "https://newsapi.org/v2/everything?q=apple&from=2020-01-02&to=2020-01-02&sortBy=popularity&apiKey=30975cb1a464494fa422fbded2862226", "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=30975cb1a464494fa422fbded2862226", "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=30975cb1a464494fa422fbded2862226"]
}
