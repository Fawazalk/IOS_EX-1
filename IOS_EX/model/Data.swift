//
//  Data.swift
//  IOS_EX
//
//  Created by Fawaz  on 9/30/21.
//

import Foundation

struct Welcome: Codable {
    let title: String
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let title, website, authors, date: String
    let content: String
    let tags: [Tag]
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case title, website, authors, date, content, tags
        case imageURL = "image_url"
    }
}

// MARK: - Tag
struct Tag: Codable {
    let id: Int
    let label: String
}
