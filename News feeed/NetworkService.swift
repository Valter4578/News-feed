//
//  NetworkService.swift
//  News feeed
//
//  Created by Максим Алексеев on 28.12.2019.
//  Copyright © 2019 Максим Алексеев. All rights reserved.
//

import UIKit

class NetworkService {
    // MARK: - Variables
    var articles = [Article]()
    
    // MARK: - Methods
    func parseJSON(from url: URL) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            print(error)
            do {
                let decoder = JSONDecoder()
                
                let articleData = try decoder.decode(Article.self, from: data!)
                print(articleData.description)
            } catch {
                print(error)
            }
        }
    }

}
