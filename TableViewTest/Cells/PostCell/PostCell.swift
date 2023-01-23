//
//  PostCell.swift
//  TableViewTest
//
//  Created by Dmitry Samusenko on 23.01.2023.
//

import UIKit

class PostCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet private var iconView: UIImageView!
    @IBOutlet private var descriptionLabel: UILabel!
    
    // MARK: - Public
    
    func configure(icon: UIImage?, text: String) {
        descriptionLabel.text = text
        iconView.image = icon
    }
}
