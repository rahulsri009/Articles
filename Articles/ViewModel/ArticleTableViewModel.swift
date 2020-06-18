//
//  ArticleTableViewModel.swift
//  Articles
//
//  Created by Rahul on 18/06/20.
//  Copyright © 2020 Articles. All rights reserved.
//

import UIKit

struct ArticleTableModel {
    var createdAt: String
    var content: String
    var comments: Int
    var likes:Int
    var image: String
    var title: String
    var url: String
    var name: String
    var avatar: String
    var lastname: String
    var designation: String
}

class ArticleTableViewModel: NSObject {
    private var dataModel: ArticleTableModel
    
    init(dataModel: ArticleTableModel) {
        self.dataModel = dataModel
    }
    
    func getTimeAgo() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        if let date: Date = dateFormatter.date(from: dataModel.createdAt) {
            let difference = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: date, to: Date())
            if let days = difference.day, days > 0 {
                return "\(days) days"
            } else if let hours = difference.hour, hours > 0 {
                return "\(hours) hours"
            } else if let minutes = difference.minute, minutes > 0 {
                return "\(minutes) minutes"
            } else if let seconds = difference.second, seconds > 0 {
                return "\(seconds) seconds"
            }
        }
        return ""
    }
    
    func getName() -> String {
        return "\(dataModel.name) \(dataModel.lastname)"
    }
    
    func getDesignation() -> String {
        return dataModel.designation
    }
    
    func getAvatarUrl() -> URL? {
        return URL(string: dataModel.avatar)
    }
    
    func getImageUrl() -> URL? {
        return URL(string: dataModel.image)
    }
    
    func getContent() -> String {
        return dataModel.content
    }
    
    func getTitle() -> String {
        return dataModel.title
    }
    
    func getUrl() -> String {
        return dataModel.url
    }
    
    func getNumberOfLikes() -> String {
        return dataModel.likes.roundedWithAbbreviations + " Likes"
    }
    
    func getNumberOfComments() -> String {
        return dataModel.comments.roundedWithAbbreviations + " Comments"
    }
}
