//
//  Constants.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/5/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import UIKit




let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor




let URL_BASE = "https://swapi.co/api/"
let PEROSON_URL = URL_BASE + "people/"



typealias PersonResponseCompletion  = (Person?) -> ()
typealias HomeworldResponseCompletion = (Homeworld?) -> ()
typealias VehicleResponseCompletion = (Vehicle?) -> ()
typealias StarshipResponseComplete = (Starships?) -> ()
typealias FilmsResponseComplete = (F?) -> ()
