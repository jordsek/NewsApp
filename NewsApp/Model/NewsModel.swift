//
//  NewsModel.swift
//  NewsApp
//
//  Created by Jordan Isac on 23/11/2023.
//

import Foundation

struct NewsResponse: Codable{
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Hashable {
    let title: String
    let author: String?
  //  let source: Source
  //  let publishedAt: Date
    let url: String
}

// MARK: - Source
struct Source: Codable, Identifiable {
    let id: String?
    let name: String
}

let articleList = Article(
    title: "Israel agrees hostage deal with Hamas: Live updates - CNN",
    author: "By <a href=\"/profiles/tara-subramaniam\">Tara Subramaniam</a>, <a href=\"/profiles/jessie-yeung\">Jessie Yeung</a>, Christian Edwards and Antoinette Radford, CNN,",
    url: "https://www.cnn.com/middleeast/live-news/israel-hamas-war-gaza-news-11-22-23/index.html")
