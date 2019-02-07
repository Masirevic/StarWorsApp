//
//  StarshipApi.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/7/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import Foundation
import Alamofire

class  StarshipApi {
    
    
    func getStarship (url: String, completion: @escaping StarshipResponseComplete) {
        
        guard let url = URL(string: url) else {return completion(nil)}
        
        Alamofire.request(url).responseJSON { (response) in
            
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            
            guard let data = response.data else {return completion(nil)}
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let starship =  try jsonDecoder.decode(Starships.self, from: data)
                completion(starship)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
            
        }
        
    }
    
    
    
    
    
}




