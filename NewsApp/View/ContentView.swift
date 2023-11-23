//
//  ContentView.swift
//  NewsApp
//
//  Created by Jordan Isac on 22/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NewsView(viewModel: NewsViewModel(repository: NewsRepositoryImplementation(networkManager: NetworkManager())))
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    
                    Text("News")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    
                    Text("Search")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    
                    Text("Settings")
                }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    ContentView()
}
