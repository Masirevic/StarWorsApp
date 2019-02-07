//
//  Vehicle.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/7/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import Foundation

struct Vehicle: Codable {
    
    let name: String
    let model: String
    let length: String
    let crew: String
    let passengers: String
    let speed: String
    
    enum CodingKeys: String, CodingKey {
        
        case name
        case model
        case length
        case crew
        case passengers
        case speed = "max_atmosphering_speed"
    }
    
}
