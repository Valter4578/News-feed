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
    var urlsString = ["https://newsapi.org/v2/everything?q=bitcoin&from=2019-12-02&sortBy=publishedAt&apiKey=c15b2503eabf49ffb370b739e4c995f2", "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c15b2503eabf49ffb370b739e4c995f2", "https://newsapi.org/v2/everything?q=apple&from=2020-01-01&to=2020-01-01&sortBy=popularity&apiKey=c15b2503eabf49ffb370b739e4c995f2", "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c15b2503eabf49ffb370b739e4c995f2", "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=c15b2503eabf49ffb370b739e4c995f2"]
}
