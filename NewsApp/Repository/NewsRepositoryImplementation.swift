//
//  NewsRepositoryImplementation.swift
//  NewsApp
//
//  Created by Jordan Isac on 23/11/2023.
//

import Foundation
final class NewsRepositoryImplementation: NewsRepository {
    
    var networkManager: Fetchable
    init(networkManager: Fetchable) {
            self.networkManager = networkManager
        }
    func getNews(url: URL) async throws -> NewsResponse {
        do {
            let data = try await networkManager.getDataFromAPI(url: url)
            let result = try JSONDecoder().decode(NewsResponse.self, from: data)
            return result
        }catch {
            throw error
        }
    }
    
    
}
