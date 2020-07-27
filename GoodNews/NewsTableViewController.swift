//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Ира on 26.07.2020.
//  Copyright © 2020 Irina Lapteva. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class NewsTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
        print("articles \(articles)")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        print(articles)
        cell.titleLabel.text = articles[indexPath.row].title
        cell.descripttionLabel.text = articles[indexPath.row].description
//        cell.titleLabel.text = "12323432"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    private func populateNews() {
        
        URLRequest.load(resourse: ArticlesList.all)
            .subscribe(onNext: { [weak self] result in
              
                    self?.articles = result.articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                
            }).disposed(by: disposeBag)
    }
}
