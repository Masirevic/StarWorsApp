//
//  Starships.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/7/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import Foundation


struct Starships: Codable {
    
    let name: String
    let model: String
    let speed: String
    let crew: String
    let length: String
    let passengers: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case speed = "max_atmosphering_speed"
        case crew
        case length
        case passengers
    }
    
}










