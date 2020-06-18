//
//  ArticlesViewModel.swift
//  Articles
//
//  Created by Rahul on 17/06/20.
//  Copyright © 2020 Articles. All rights reserved.
//

import UIKit

enum ArticleTableViewType {
    case loading
    case articleCell(model: ArticleTableViewModel)
}

protocol ReloadDelegate: class {
    func reload()
}

class ArticlesViewModel: NSObject {
    
    var articlesDataSource:[ArticleTableViewType] = []
    var loadingDataSource:ArticleTableViewType = ArticleTableViewType.loading
    
    let networkManager:NetworkManager = NetworkManager()
    weak var reloadDelegate: ReloadDelegate?
    
    let reloadTablView:()
    var nextPage: Int = 1
    var limit: Int = 10
    
    override init() {
        super.init()
        getArticles()
    }
    
    private func getArticles() {
        networkManager.request(with: RequestEndPoint.getAtricles(page: nextPage, limit: limit), modelType: [Article].self) { (response, error) in
            if let articles:[Article] = response {
                self.nextPage += 1
                print("Articles: \(articles.count)")
                self.prepareArticlesDataSource(articles: articles)
                self.reloadDelegate?.reload()
            } else {
                print(error ?? "Error while requesting getPersonalityQuestions")
            }
        }
    }
    
    private func prepareArticlesDataSource(articles: [Article]) {
        for article in articles {
            let image = article.media.count > 0 ? article.media[0].image : ""
            let title = article.media.count > 0 ? article.media[0].title : ""
            let url = article.media.count > 0 ? article.media[0].url : ""
            let name = article.user.count > 0 ? article.user[0].name : ""
            let avatar = article.user.count > 0 ? article.user[0].avatar : ""
            let lastname = article.user.count > 0 ? article.user[0].lastname : ""
            let designation = article.user.count > 0 ? article.user[0].designation : ""
            let articleModel = ArticleTableModel(createdAt: article.createdAt, content: article.content, comments: article.comments, likes: article.likes, image: image, title: title, url: url, name: name, avatar: avatar, lastname: lastname, designation: designation)
            articlesDataSource.append(.articleCell(model: ArticleTableViewModel(dataModel: articleModel)))
        }
    }
    
    private func cellForArticle(tableView: UITableView, viewModel: ArticleTableViewModel) -> ArticleTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.reuseIdentifier) as! ArticleTableViewCell
        cell.prepareCell(with: viewModel)
        return cell
    }
    
    private func cellForLoader(tableView: UITableView) -> LoadingTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.reuseIdentifier) as! LoadingTableViewCell
        return cell
    }
}

extension ArticlesViewModel: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return articlesDataSource.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0, case let ArticleTableViewType.articleCell(model) = articlesDataSource[indexPath.row] {
            return cellForArticle(tableView: tableView, viewModel: model)
        } else {
            return cellForLoader(tableView: tableView)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 200
        }
    }
}
