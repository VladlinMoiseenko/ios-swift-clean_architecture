//
//  NewsWorker.swift
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

import Foundation
import Alamofire

protocol NewsFetcherType {
    func fetchNews(completion: @escaping ([News]?) -> Void)
}

class NewsListWorker: NewsFetcherType {
    
    private let requestURL = "https://newsapi.org/v2/top-headlines?country=us"
    private let apiKey = "API_KEY"
    
    func fetchNews(completion: @escaping ([News]?) -> Void) {
        Alamofire.request(
            requestURL,
            parameters: ["apiKey": apiKey]
            ).responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    print("Error while fetching: \(response.result.error)")
                    completion(nil)
                    return
                }
                
                guard let value = response.result.value as? [String: AnyObject],
                    let rows = value["articles"] as? [[String: AnyObject]] else { 
                        print("Malformed data received from service")
                        completion(nil)
                        return
                }
                
                var news = [News]()
                
                for row in rows {
                    
                    var title = ""
                    if let _title = row["title"] as? String {
                        title = _title
                    }
                    
                    var author = ""
                    if let _author = row["author"] as? String {
                        author = _author
                    }
                    
                    var description = ""
                    if let _description = row["description"] as? String {
                        description = _description
                    }
 
                    var urlToImage = ""
                    if let _urlToImage = row["urlToImage"] as? String {
                        urlToImage = _urlToImage
                    }
                    
                    news.append(News(title: title, author: author, description: description, urlToImage: urlToImage))
                    
                }
            
                completion(news)
        }
    }
    
}
