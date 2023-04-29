//
//  Comment.swift
//  MVP
//
//  Created by Aleksey Alyonin on 26.04.2023.
//

import UIKit

struct Comment : Decodable {

    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
    
    enum CodingKeys: CodingKey {
        case postId
        case id
        case name
        case email
        case body
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Comment.CodingKeys> = try decoder.container(keyedBy: Comment.CodingKeys.self)
        
        self.postId = try container.decode(Int.self, forKey: Comment.CodingKeys.postId)
        self.id = try container.decode(Int.self, forKey: Comment.CodingKeys.id)
        self.name = try container.decode(String.self, forKey: Comment.CodingKeys.name)
        self.email = try container.decode(String.self, forKey: Comment.CodingKeys.email)
        self.body = try container.decode(String.self, forKey: Comment.CodingKeys.body)
        
    }
    
}
