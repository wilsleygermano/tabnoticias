//
//  news_status.swift
//  tabnoticias
//
//  Created by Wilsley Germano on 18/09/23.
//

import Foundation

enum NewsStatus: Decodable{
    case published(value: String = "published")
    case deleted(value: String = "deleted")
}
