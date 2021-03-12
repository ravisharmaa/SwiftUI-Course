//
//  Items.swift
//  SwiftUI-Course
//
//  Created by Ravi Bastola on 2/7/21.
//

import Foundation

struct Response: Codable, Hashable {
    
    let items: [Items]
}

struct Items: Codable, Hashable, Identifiable {
    
    let id: UUID = UUID()
    let tags: [String]?
    let owner: Owner
    let isAnswered: Bool?
    let viewCount, answerCount, score, lastActivityDate: Int?
    let creationDate, questionID: Int
    let contentLicense: String?
    let link: String?
    let title: String?
    let acceptedAnswerId: Int?
    let body: String?
    let answerId: Int?
    

    enum CodingKeys: String, CodingKey {
        case id
        case tags, owner
        case isAnswered = "is_answered"
        case viewCount = "view_count"
        case answerCount = "answer_count"
        case score
        case lastActivityDate = "last_activity_date"
        case creationDate = "creation_date"
        case questionID = "question_id"
        case contentLicense = "content_license"
        case link, title
        case acceptedAnswerId = "accepted_answer_id"
        case body = "body"
        case answerId = "answer_id"
    }
    
    static var placeholder: Items {
        return .init(tags: [], owner: Owner.placeholder, isAnswered: nil, viewCount: nil, answerCount: nil, score: nil, lastActivityDate: nil, creationDate: 1234, questionID: 10327, contentLicense: nil, link: nil, title: nil, acceptedAnswerId: nil, body: nil, answerId: nil)
    }
}

// MARK: - Owner
struct Owner: Codable, Hashable {
    let reputation, userId: Int
    let userType: String
    let acceptRate: Int?
    let profileImage: String
    let displayName: String
    let link: String?

    enum CodingKeys: String, CodingKey {
        case reputation
        case userId = "user_id"
        case userType = "user_type"
        case acceptRate = "accept_rate"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
    }
    
    static var placeholder: Owner {
        return .init(reputation: 11, userId: 11, userType: "", acceptRate: nil, profileImage: "", displayName: "", link: nil)
    }
}
