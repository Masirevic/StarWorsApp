//
//  HomeworldApi.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/7/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import Foundation
import Alamofire


class HomeworldApi {
    
    func getHomeworld (url: String, completion: @escaping HomeworldResponseCompletion) {
        
        guard let url = URL(string: url) else {return}
        
        Alamofire.request(url).responseJSON { (resposnse) in
        
            if let error = resposnse.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = resposnse.data else {return completion (nil)}
            
            let jsonDecoder = JSONDecoder()
            
            
            do {
                let homeworld = try jsonDecoder.decode(Homeworld.self, from: data)
                completion(homeworld)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
        
        
        
        
        
    }
    
    
    
}


