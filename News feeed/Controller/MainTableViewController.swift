//
//  MainTableViewController.swift
//  News feeed
//
//  Created by Максим Алексеев on 28.12.2019.
//  Copyright © 2019 Максим Алексеев. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var apiUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networkService = NetworkService()
        apiUrl = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2019-11-30&sortBy=publishedAt&apiKey=c15b2503eabf49ffb370b739e4c995f2")
        networkService.parseJSON(from: apiUrl)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }


}
