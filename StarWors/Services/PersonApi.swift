//
//  PersonApi.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/5/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonApi {
    
    func getRandomAlamo(n: Int, completion: @escaping PersonResponseCompletion) {
        
        guard let url = URL(string: "\(PEROSON_URL)\(n)") else {return}
        
        Alamofire.request(url).responseJSON { (response) in
            
            if let error = response.result.error {
                debugPrint("Network problem with downloding URL \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = response.data else { return completion(nil) }
            do {
                let json = try JSON(data: data)
                let person = self.parsePersonSwiftyJSON(json: json)
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
        
        
    }
    
//    func getRandomAlamo (n: Int, completion: @escaping PersonResponseCompletion) {
//
//        guard let url = URL(string: "\(PEROSON_URL)\(n)") else {return}
//
//        Alamofire.request(url).responseJSON { (response) in
//
//            if let error = response.result.error {
//                debugPrint("Network problem with downloding URL \(error.localizedDescription)")
//                completion(nil)
//                return
//            }
//                guard let json = response.result.value as? [String: Any] else { return
//                    completion(nil) }
//
//                    let person = self.parsePersonManual(json: json)
//                    completion(person)
//
//        }
//
//
//    }
    
//    func getRandomPersonURLSession (n: Int, completion: @escaping PersonResponseCompletion) {
//
//        guard let url = URL(string: "\(PEROSON_URL)\(n)") else {return}
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//
//            if let error = error {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//                return
//            }
//
//
//            guard let data = data else {return}
//            do {
//            let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
//                guard let json = jsonAny as? [String: Any] else {return}
//
//                let person = self.parsePersonManual(json: json)
//                DispatchQueue.main.async {
//                    completion(person)
//                }
//
//
//            } catch {
//                debugPrint(error.localizedDescription)
//            }
//        }
//
//        task.resume()
//
//    }
    
    func parsePersonSwiftyJSON(json: JSON) -> Person {
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair = json["hair_color"].stringValue
        let birthYear =  json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeworldUrl = json["homeworls"].stringValue
        let filmUrls = json["films"].arrayValue.map({$0.stringValue})
        let vehicleUrls = json["vehicles"].arrayValue.map({$0.stringValue})
        let starshipUrls = json["starships"].arrayValue.map({$0.stringValue})
        
        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
        
    }
    
//    func parsePersonManual(json: [String: Any]) -> Person {
//        let name = json["name"] as? String ?? ""
//        let height = json["height"]  as? String ?? ""
//        let mass = json["mass"] as? String ?? ""
//        let hair = json["hair_color"] as? String ?? ""
//        let birthYear =  json["birth_year"] as? String ?? ""
//        let gender = json["gender"] as? String ?? ""
//        let homeworldUrl = json["homeworls"] as? String ?? ""
//        let filmUrls = json["films"] as? [String] ?? [String]()
//        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
//        let starshipUrls = json["starships"] as? [String] ?? [String]()
//
//        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
//
//    }
}


