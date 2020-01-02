//
//  MainTableViewController.swift
//  News feeed
//
//  Created by Максим Алексеев on 28.12.2019.
//  Copyright © 2019 Максим Алексеев. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    // MARK: - Dependencies
    var networkService: NetworkService?
    // MARK: - Public properties
    var articles: Articles?
    // MARK: - Constants
    
    // MARK: - Private properties
    private var apiUrl: URL?
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        networkService = NetworkService()
        apiUrl = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2019-12-02&sortBy=publishedAt&apiKey=c15b2503eabf49ffb370b739e4c995f2")
        networkService?.parseJSON(from: apiUrl!)
        
        networkService?.delegate = self
    }

    // MARK: - Table view data source
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.articles.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "main cell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.articleDescription.text = articles?.articles[indexPath.row].description
        cell.title.text = articles?.articles[indexPath.row].title
        cell.source.text = articles?.articles[indexPath.row].source.name
        
        return cell
        
    }


}

extension MainTableViewController: NetworkServiceDelegate {

    func transferArticleData(data: Articles) {
        articles = data
        DispatchQueue.main.async {
            self.tableView.reloadData()

        }
    }
    
    
}
