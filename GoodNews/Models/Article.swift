//
//  Articles.swift
//  GoodNews
//
//  Created by Ира on 27.07.2020.
//  Copyright © 2020 Irina Lapteva. All rights reserved.
//

import UIKit

struct ArticlesList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}

extension ArticlesList {
    static var all: Resourse<ArticlesList> = {
      let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=953d2b71c94f4ff081a2d719712f29cd")!
        return Resourse(url: url)
    }()
}
