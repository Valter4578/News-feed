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
    // MARK: - Outlets
    @IBOutlet weak var segmentControl: UISegmentedControl!
    // MARK: - Public properties
    var articles: Articles?
    var articlesTopics: ArticlesTopics? = ArticlesTopics()
    // MARK: - Constants
    
    // MARK: - Private properties
    private var apiUrl: URL?
    private var currentTopicUrl: String? 
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
         
        currentTopicUrl = articlesTopics?.urlsString[0]
        
        segmentControlSetup()
        networkServiceSetup()
        
    }
    // MARK: - Setups
    private func networkServiceSetup() {
        networkService = NetworkService()
        apiUrl = URL(string: currentTopicUrl!)
        networkService?.parseJSON(from: apiUrl!)
        
        networkService?.delegate = self
    }
    
    private func segmentControlSetup() {
        segmentControl.addTarget(self, action: #selector(selectedValue(for:)), for: .valueChanged)
    }
    
    // MARK: - Public methods
    @objc func selectedValue(for control: UISegmentedControl) {
        if control == self.segmentControl {
            let segmentIndex = control.selectedSegmentIndex
            
            if let topicUrl = self.articlesTopics?.topics[segmentIndex] {
                self.currentTopicUrl = topicUrl
                networkServiceSetup()
            }
            
        }
    }
    // MARK: - Private methods
    
    
    // MARK: - Table view data source implemention
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.articles.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "main cell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.title.text = articles?.articles[indexPath.row].title
        cell.source.text = articles?.articles[indexPath.row].source.name
        
        return cell
        
    }
    
    

}
// MARK: - Network service delegate
extension MainTableViewController: NetworkServiceDelegate {

    func transferArticleData(data: Articles) {
        articles = data
        DispatchQueue.main.async {
            self.tableView.reloadData()

        }
    }
    
    
}
