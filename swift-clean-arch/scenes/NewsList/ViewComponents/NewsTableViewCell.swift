//
//  NewsTableViewCell.swift
//  swift-clean-arch
//
//  Created by Admin on 02/10/2019.
//  Copyright © 2019 Vladlin Moiseenko. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var urlimage: UIImageView!
    
    var requestResponse: News!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func configure(_ data: News) {
        requestResponse = data
        populateData()
    }
    
    fileprivate func populateData() {
        
        titleLabel.text = requestResponse.title
        authorLabel.text = requestResponse.author
        descriptionLabel.text = requestResponse.description
        
        let url = URL(string: requestResponse.urlToImage)
        let processor = RoundCornerImageProcessor(cornerRadius: 10)
        urlimage.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
        
    }
    
}
