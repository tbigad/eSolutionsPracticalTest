//
//  ListOfItemCollectionViewCell.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import UIKit

final class ListOfItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var roundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundView.layer.cornerRadius = 8
        roundView.layer.borderWidth = 1
        roundView.layer.borderColor = UIColor.secondaryLabel.withAlphaComponent(0.8).cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = UIImage(named: "placeholder")
    }
    
    func setupCell(title:String,price:Double,imageUrl:URL?) {
        titleLabel.text = title
        priceLabel.text = String(format: "%.02f$", price)
        if let url = imageUrl {
            imageView.load(url: url, placeholder: UIImage(named: "placeholder"))
        }
    }
}
