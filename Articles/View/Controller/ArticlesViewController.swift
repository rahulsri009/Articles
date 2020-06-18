//
//  ArticlesViewController.swift
//  Articles
//
//  Created by Rahul on 17/06/20.
//  Copyright © 2020 Articles. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = ArticlesViewModel()
    
    static func newInstance() -> ArticlesViewController {
        let viewController: ArticlesViewController = ArticlesViewController(nibName: "ArticlesViewController", bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        viewController.title = "Articles"
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        setupViewModel()
    }
    
    func setupViewModel() {
        viewModel.reloadDelegate = self
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
    }
    
    private func prepareTableView() {
        ArticleTableViewCell.registerWithTableView(tableView)
        LoadingTableViewCell.registerWithTableView(tableView)
    }
}

extension ArticlesViewController: ReloadDelegate {
    func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
