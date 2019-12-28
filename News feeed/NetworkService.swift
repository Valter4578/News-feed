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
    /// Method that will be get latest articles in json from newsapi.org
    /// - Parameter url: api url
    func getLatestArticles(url: String, tableView: UITableView) {
        guard let articleUrl = URL(string: url) else { return }
        
        let request = URLRequest(url: articleUrl)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            // Parse JSON data
            if let data = data {
                self.articles = self.parseJSONData(data: data)
                
                tableView.reloadData()
            }
        }
        task.resume()
    }
    
    func parseJSONData(data: Data) -> [Article] {
        var articles = [Article]()
        
        let decoder = JSONDecoder()
        
        do {
            let articleDataStore = try? decoder.decode(ArticleDataStore.self, from: data)
            articles = articleDataStore!.articles
        } catch {
            print(error)
        }
        return articles
    }
}
