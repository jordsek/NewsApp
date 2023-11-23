//
//  NewsRepository.swift
//  NewsApp
//
//  Created by Jordan Isac on 23/11/2023.
//

import Foundation

import Foundation
protocol NewsRepository {
    func getNews(url: URL) async throws -> NewsResponse
}

