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
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let decoder = JSONDecoder()
                
                let articleData = try decoder.decode(Articles.self, from: data!)
                self.delegate?.transferArticleData(data: articleData)
                print(articleData.articles?.description)
            } catch {
                print(error)
            }
        }
        task.resume()
    }

    
}
