//
//  NewsView.swift
//  NewsApp
//
//  Created by Jordan Isac on 23/11/2023.
//

import SwiftUI

struct NewsView: View {
    //MARK: -PROPERTIES
    @StateObject var viewModel: NewsViewModel
    @State private var isLoading = true
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView{
                    if isLoading != true {
                        ForEach(viewModel.articleArray, id: \.self){ article in
                            //Text(article.title)
                            NewsCardView(article: article)
                        }
                    }
                }
            }
            .navigationTitle("News")
            //.preferredColorScheme(.dark)
            .task {
                await viewModel.getNewsList(urlString: APIEndPoint.NewsListAPIEndPoint)
                isLoading = false
        }
        }
    }
}

#Preview {
    NewsView(viewModel: NewsViewModel(repository: NewsRepositoryImplementation(networkManager: NetworkManager())))
}
