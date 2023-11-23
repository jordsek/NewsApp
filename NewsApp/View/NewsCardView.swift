//
//  NewsCardView.swift
//  NewsApp
//
//  Created by Jordan Isac on 23/11/2023.
//

import SwiftUI
import Kingfisher

struct NewsCardView: View {
    //MARK: -Properties
    var article: Article
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            KFImage(URL(string: article.url ?? ""))
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 230)
            
            LinearGradient(colors: [Color.clear, Color.black.opacity(0.7)], startPoint: .top, endPoint: .bottom)
            //Title
            VStack(alignment: .leading, spacing: 4){
                Text(article.title)
                    .font(.title3)
                    .foregroundStyle(.white)
                    .bold()
                    .lineLimit(2)
                    .padding(.horizontal, 16)
            }
        }
        .padding(4)
        .frame(maxWidth: .infinity, maxHeight: 230, alignment: .leading)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

#Preview {
    NewsCardView(article: articleList)
}
