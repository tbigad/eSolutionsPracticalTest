//
//  CategoriesCollectionViewCell.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import UIKit

final class CategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var roundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundView.layer.cornerRadius = 8
        roundView.layer.borderWidth = 1
        roundView.layer.borderColor = UIColor.secondaryLabel.withAlphaComponent(0.8).cgColor
    }
    
    func setupCell(title:String, subtitle:String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
