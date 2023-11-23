//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Jordan Isac on 23/11/2023.
//

import Foundation

class NewsViewModel: ObservableObject{
    @Published var articleArray: [Article] = []
    @Published var customError: NetworkError?
    
    let repository: NewsRepository
    init(repository: NewsRepository){
        self.repository = repository
    }
    
    func getNewsList(urlString: String) async{
        guard let url = URL(string:urlString) else {
            customError = NetworkError.invalidURL
            return
        }
        do {
            let result = try await repository.getNews(url: url)
            DispatchQueue.main.async { [self] in
                self.articleArray = result.articles
                print(articleArray)
            }
            
        }catch let someError {
            //print(someError.localizedDescription)
            debugPrint(someError)
            if someError as? NetworkError == .dataNotFound{
                self.customError = NetworkError.dataNotFound
            }else{
                self.customError = NetworkError.parsingError
            }
        }
        
    }
}
