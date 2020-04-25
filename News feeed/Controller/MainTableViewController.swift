//
//  MainTableViewController.swift
//  News feeed
//
//  Created by Максим Алексеев on 28.12.2019.
//  Copyright © 2019 Максим Алексеев. All rights reserved.
//

import UIKit
import CoreData

@objc
class MainTableViewController: UITableViewController {
    // MARK: - Dependencies
    var networkService: NetworkService?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    // MARK: - Outlets
    @IBOutlet weak var segmentControl: UISegmentedControl!
    // MARK: - Public properties
    var articles: NewsArticles?
    var articlesTopics: ArticlesTopics? = ArticlesTopics()
    // MARK: - Constants
    
    // MARK: - Private properties
    private var currentTopicUrl: String?
    private var isThereDataInContext: Bool?
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentTopicUrl = articlesTopics?.urlsString[0]
        
        segmentControlSetup()
        if !(isThereDataInContext ?? false) {
            networkServiceSetup()
            
        }
        
    }
    // MARK: - Setups
    private func networkServiceSetup() {
        
        guard let apiUrl = URL(string: currentTopicUrl!) else { return }
        NetworkService.parseJSON(from: apiUrl) { (data) in
            self.articles = data
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }
            self.createNewAticle()
        }
    }
    
    private func segmentControlSetup() {
        segmentControl.addTarget(self, action: #selector(selectedValue(for:)), for: .valueChanged)
    }
    
    // MARK: - Public methods
    @objc func selectedValue(for control: UISegmentedControl) {
        if control == self.segmentControl {
            let segmentIndex = control.selectedSegmentIndex
            
            if let topicUrl = self.articlesTopics?.urlsString[segmentIndex] {
                self.currentTopicUrl = topicUrl
                networkServiceSetup()
            }
            
        }
    }

    // MARK: - Table view data source implemention
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.articles?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "main cell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.title.text = articles?.articles?[indexPath.row].title
        cell.source.text = articles?.articles?[indexPath.row].source.name
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let articleViewController = storyboard?.instantiateViewController(identifier: "articleVC") as? ArticleViewController else { return }
//        guard let articleNavigationController = storyboard?.instantiateViewController(identifier: "articleNC") else { return }
        // Send selected article to ArticleVC
        articleViewController.articles = articles
        articleViewController.selectedIndex = indexPath.row
        // Present articleVC
        navigationController?.pushViewController(articleViewController, animated: true)
    }
}
// MARK: - Network service delegate
extension MainTableViewController: NetworkServiceDelegate {

    func transferArticleData(data: NewsArticles) {
        articles = data
        DispatchQueue.main.async {
            self.tableView.reloadData()

        }
    }
}
