//
//  ArticleTableViewCell.swift
//  Articles
//
//  Created by Rahul on 17/06/20.
//  Copyright © 2020 Articles. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    var viewModel: ArticleTableViewModel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        articleImageView.isHidden = true
        titleLabel.isHidden = true
        contentLabel.isHidden = true
        urlLabel.isHidden = true
        viewModel = nil
        avatarImageView.image = nil
        articleImageView.image = nil
        userNameLabel.text = ""
        designationLabel.text = ""
        timeLabel.text = ""
        contentLabel.text = ""
        titleLabel.text = ""
        urlLabel.text = ""
        likesLabel.text = ""
        commentsLabel.text = ""
    }
    
    func prepareCell(with viewModel: ArticleTableViewModel) {
        self.viewModel = viewModel
        setupUI()
    }
    
    func setupUI() {
        if let avatarUrl = viewModel.getAvatarUrl(), let imageData = try? Data(contentsOf: avatarUrl) {
            avatarImageView.image = UIImage(data: imageData)
        }
        if let articleImageUrl = viewModel.getImageUrl(), let imageData = try? Data(contentsOf: articleImageUrl) {
            articleImageView.isHidden = false
            articleImageView.image = UIImage(data: imageData)
        }
        titleLabel.isHidden = false
        contentLabel.isHidden = false
        urlLabel.isHidden = false
        timeLabel.text = viewModel.getTimeAgo()
        userNameLabel.text = viewModel.getName()
        designationLabel.text = viewModel.getDesignation()
        contentLabel.text = viewModel.getContent()
        titleLabel.text = viewModel.getTitle()
        urlLabel.text = viewModel.getUrl()
        likesLabel.text = viewModel.getNumberOfLikes()
        commentsLabel.text = viewModel.getNumberOfComments()
    }
}
