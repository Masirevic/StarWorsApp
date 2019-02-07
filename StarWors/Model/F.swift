//
//  F.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/7/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import Foundation



struct F: Codable {
    
    let title: String
    let episode: Int
    let director: String
    let producer: String
    let year: String
    let crawl: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case episode = "episode_id"
        case director
        case producer
        case crawl = "opening_crawl"
        case year = "release_date"
    }
    
    
}
