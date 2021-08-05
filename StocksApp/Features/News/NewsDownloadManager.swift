//
//  NewsDownloadManager.swift
//  StocksApp
//
//  Created by 김정민 on 2021/08/05.
//

import Foundation

final class NewsDownloadManager: ObservableObject {
    @Published var newsArticles = [News]()

    // https://newsapi.org/docs/endpoints/sources
    private let newsUrlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(NewsAPI.key)"

    init() {
        download()
    }

    func download() {
        NetworkManager<NewsResponse>().fetch(from: URL(string: newsUrlString)!) { result in
            switch result {
            case .failure(let err):
                print("NewsDownloadManager - download - error: \(err.localizedDescription)")
            case .success(let response):
                DispatchQueue.main.async {
                    self.newsArticles = response.articles
                }
            }
        }
    }
}


