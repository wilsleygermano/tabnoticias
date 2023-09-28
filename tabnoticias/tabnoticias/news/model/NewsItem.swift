//
//  NewsModel.swift
//  tabnoticias
//
//  Created by Wilsley Germano on 18/09/23.
//

import Foundation


struct NewsItem: Identifiable, Decodable, Hashable {
    let id: String?
    let ownerId: String?
    let parentId: String?
    let slug: String?
    let title: String?
    let status: String?
    let sourceUrl: String?
    let creationDate: String?
    let updateDate: String?
    let publishingDate: String?
    let deletionDate: String?
    let tabCount: Int?
    let ownerUsername: String?
    let comments: Int?
    
    init(id: String?, ownerId: String?, parentId: String?, slug: String?, title: String?, status: String?, sourceUrl: String?, creationDate: String?, updateDate: String?, publishingDate: String?, deletionDate: String?, tabCount: Int?, ownerUsername: String?, comments: Int?) {
        self.id = id
        self.ownerId = ownerId
        self.parentId = parentId
        self.slug = slug
        self.title = title
        self.status = status
        self.sourceUrl = sourceUrl
        self.creationDate = creationDate
        self.updateDate = updateDate
        self.publishingDate = publishingDate
        self.deletionDate = deletionDate
        self.tabCount = tabCount
        self.ownerUsername = ownerUsername
        self.comments = comments
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: NewsItemlKeys.self)

        id = try? container.decode(String.self, forKey: .id)
        ownerId = try? container.decode(String.self, forKey: .ownerId)
        parentId = try? container.decode(String.self, forKey: .parentId)
        slug = try? container.decode(String.self, forKey: .slug)
        title = try? container.decode(String.self, forKey: .title)
        status = try? container.decode(String.self, forKey: .status)
        sourceUrl = try? container.decode(String.self, forKey: .sourceUrl)
        creationDate = try? container.decode(String.self, forKey: .creationDate)
        updateDate = try? container.decode(String.self, forKey: .updateDate)
        publishingDate = try? container.decode(String.self, forKey: .publishingDate)
        deletionDate = try? container.decode(String.self, forKey: .deletionDate)
        tabCount = try? container.decode(Int.self, forKey: .tabCount)
        ownerUsername = try? container.decode(String.self, forKey: .ownerUsername)
        comments = try? container.decode(Int.self, forKey: .comments)
    }
    
    enum NewsItemlKeys: String, CodingKey {
        case id = "id"
        case ownerId = "owner_id"
        case parentId = "parent_id"
        case slug = "slug"
        case title = "title"
        case status = "status"
        case sourceUrl = "source_url"
        case creationDate = "created_at"
        case updateDate = "updated_at"
        case publishingDate = "published_at"
        case deletionDate = "deleted_at"
        case tabCount = "tabcoins"
        case ownerUsername = "owner_username"
        case comments = "children_deep_count"
    }
    
}

