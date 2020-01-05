//
//  NetworkService.swift
//  News feeed
//
//  Created by Максим Алексеев on 28.12.2019.
//  Copyright © 2019 Максим Алексеев. All rights reserved.
//

import UIKit

protocol NetworkServiceDelegate: class {
    func transferArticleData(data: Articles)
}

class NetworkService {
    // MARK: - Public properties
    var delegate: NetworkServiceDelegate?
    // MARK: - Methods
    func parseJSON(from url: URL) {

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(error ?? "Unknown error")
                return
            }

            do {
                let articleData = try JSONDecoder().decode(Articles.self, from: data)
                guard let articles = articleData.articles else {
                    print("No articles", articleData.status, articleData.message ?? "No message")
                    return
                }
                
                self.delegate?.transferArticleData(data: articleData)
                
                for article in articles {
                    print(article.description)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
