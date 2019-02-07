//
//  HomeworldVC.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/6/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController {
    
    var person: Person!
    let api = HomeworldApi()
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.getHomeworld(url: person.homeworldUrl) { (homeworld) in
            if let homeworld = homeworld {
                self.setUpView(homeworld: homeworld)
            }
        }
       
    }
    
    func setUpView (homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
    

   

}
