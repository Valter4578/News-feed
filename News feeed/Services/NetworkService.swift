//
//  NetworkService.swift
//  News feeed
//
//  Created by Максим Алексеев on 28.12.2019.
//  Copyright © 2019 Максим Алексеев. All rights reserved.
//

import UIKit

protocol NetworkServiceDelegate: class {
    func transferArticleData(data: NewsArticles)
}

class NetworkService {
    // MARK: - Public properties
    var delegate: NetworkServiceDelegate?
    // MARK: - Methods
    class func parseJSON(from url: URL, complition: @escaping (NewsArticles) -> ()) {

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(error ?? "Unknown error")
                return
            }

            do {
                let articleData = try JSONDecoder().decode(NewsArticles.self, from: data)
                guard let articles = articleData.articles else {
                    print("No articles", articleData.status, articleData.message ?? "No message")
                    return
                }
                
                complition(articleData)
                
                for article in articles {
                    print(article.description)
                }
            } catch {
                print(error)
                print(String(data: data, encoding: .utf8))
            }
        }
        task.resume()
    }
    
    func getImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        task.resume()
    }
}
