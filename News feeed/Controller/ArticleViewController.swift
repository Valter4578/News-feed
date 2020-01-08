//
//  ArticleViewController.swift
//  News feeed
//
//  Created by Максим Алексеев on 28.12.2019.
//  Copyright © 2019 Максим Алексеев. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    // MARK: - Dependencies
    let networkService = NetworkService()
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    // MARK: - Public properties
    var articles: NewsArticles?
    var selectedIndex: Int = 0 
    // MARK: - Constants
    
    // MARK: - Private properties

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        networkService.delegate = self
        
        setupUI()
    }

    // MARK: - Configure
    private func setupUI() {
        titleLabel.text = articles?.articles?[selectedIndex].title
        
        descriptionLabel.text = articles?.articles?[selectedIndex].description
        contentLabel.text = articles?.articles?[selectedIndex].content
    }
    // MARK: - Public methods
    
    // MARK: - Private methods
    
    // MARK: - Actions
    @IBAction func cancelButtonClicked(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ArticleViewController: NetworkServiceDelegate {
    func transferArticleData(data: NewsArticles) {
        print("dfas")
    }
    
    
}
