//
//  FeedItem.swift
//  TableViewTest
//
//  Created by Dmitry Samusenko on 23.01.2023.
//

import UIKit

struct PostItem {
    var type: PostItemType
    var image: UIImage?
    var text: String
}

enum PostItemType {
    case ad
    case post
}
