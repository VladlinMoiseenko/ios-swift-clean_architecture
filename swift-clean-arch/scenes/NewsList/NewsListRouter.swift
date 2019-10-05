//
//  NewsRouter.swift
//  swift-clean-arch
//
//  Created by Admin on 30/09/2019.
//  Copyright (c) 2019 Vladlin Moiseenko. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NewsListRoutingLogic {
    func navigateToNewsDetailsScreen()
}

class NewsListRouter: NSObject, NewsListRoutingLogic {
    
    weak var viewController: NewsListViewController?
    
    func navigateToNewsDetailsScreen() {
        viewController?.performSegue(withIdentifier: Constants.showNewsDetailsSegueIdentifier.rawValue, sender: nil)
    }
}