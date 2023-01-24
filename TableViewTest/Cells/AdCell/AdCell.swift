//
//  AdCell.swift
//  TableViewTest
//
//  Created by Dmitry Samusenko on 23.01.2023.
//

import UIKit
protocol AdDelegate: AnyObject {
    func didTapActionButton(cell: UITableViewCell)
}

class AdCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet private var infoLabel: UILabel!
    @IBOutlet private var actionButton: UIButton!
    
    // MARK: - Public
    weak var delegate: AdDelegate?
    
    func configure(with info: String) {
        infoLabel.text = info
    }
     // MARK: - Throw action from awakeFromNib()
    override func awakeFromNib() {
        super.awakeFromNib()
        actionButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
    }
    
    @objc private func didTapActionButton() {
        delegate?.didTapActionButton(cell: self)
    }
    
}
