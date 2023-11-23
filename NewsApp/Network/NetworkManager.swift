//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Jordan Isac on 09/07/2023.
//

import Foundation

struct NetworkManager {
    let urlSession: Networking
    init(urlSession: Networking = URLSession.shared){
        self.urlSession = urlSession
    }
}

extension NetworkManager: Fetchable {
    func getDataFromAPI(url: URL) async throws -> Data {
        
        do{
            let (data, _) = try await urlSession.data(from: url, delegate: nil)
            return data
        }catch let error{
            throw error
        }
    }
}
