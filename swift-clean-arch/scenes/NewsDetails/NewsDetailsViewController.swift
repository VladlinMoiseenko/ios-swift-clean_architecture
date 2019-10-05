//
//  NewsDetailsViewController.swift
//  swift-clean-arch
//
//  Created by Admin on 02/10/2019.
//  Copyright © 2019 Vladlin Moiseenko. All rights reserved.
//

import UIKit
import Kingfisher

class NewsDetailsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var urlimage: UIImageView!
    
    let screenTitle = "News details"
    var selectedNews: News!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = screenTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
    }
    
    fileprivate func populateData() {

        titleLabel.text = selectedNews.title
        authorLabel.text = selectedNews.author
        descriptionLabel.text = selectedNews.description
        
        let url = URL(string: selectedNews.urlToImage)
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
