//
//  NewsResponse.swift
//  TestNewsApp
//
//  Created by Taewoo Kim on 2022/02/27.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    var id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: Article {
        .init(author: "Joey Garrison, Celina Tebor, Ledyard King and John Bacon, USA TODAY", url: "https://www.usatoday.com/story/news/politics/2022/03/16/ukraine-invasion-live-updates-zelenskyy-congress/7056525001/", source: "USA Today", title: "Watch live: Ukrainian President Zelenskyy to address Congress as Russian fighting intensifies in Kyiv suburbs - USA TODAY", articleDescription: "Watch live as Ukrainian President Volodymyr Zelenskyy addresses Congress on Wednesday, where he is expected to urge greater assistance.", image: "https://www.gannett-cdn.com/presto/2022/03/16/USAT/c7d591a0-bead-4ce8-bf4b-77c03554af99-AP_Russia_Ukraine_War.jpg?auto=webp&crop=3276,1843,x2,y8&format=pjpg&width=1200", date: Date())
    }
}
