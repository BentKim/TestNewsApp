//
//  ContentView.swift
//  TestNewsApp
//
//  Created by Taewoo Kim on 2022/02/27.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    var body: some View {
        Group{
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            case .success(let articles):
                NavigationView {
                    List(articles) { item in
                        ArticleView(article: item)
                            .onTapGesture {
                                load(url: item.url)
                            }
                    }
                    .navigationTitle(Text("News"))
                }
            }
        }.onAppear {
            viewModel.getArticles()
        }
    }
    
    func load(url: String?) {
        guard let link = url, let url = URL(string: link) else {
            return
        }
        openUrl(url)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
