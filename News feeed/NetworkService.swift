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
    
    // MARK: - Methods
    func parseJSON(from url: URL) {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let decoder = JSONDecoder()
                
                let articleData = try decoder.decode(Articles.self, from: data!)
                print(articleData.articles.description)
            } catch {
                print(error)
            }
        }
        task.resume()
    }

}
