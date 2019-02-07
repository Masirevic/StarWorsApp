//
//  ViewController.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/5/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    

    
    var personApi = PersonApi()
    var personToPass: Person!
    
    var randomNumber: Int!
    
    
    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var heightTxt: UILabel!
    @IBOutlet weak var massTxt: UILabel!
    @IBOutlet weak var hairTxt: UILabel!
    @IBOutlet weak var birthYearTxt: UILabel!
    @IBOutlet weak var genderTxt: UILabel!
    
    
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var strashipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    
    
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func randomClicked(_ sender: Any) {
        
        randomNumber = Int.random(in: 1...87)
        spiner.startAnimating()
        personApi.getRandomAlamo(n: randomNumber) { (person) in
            if let person = person {
                self.setUpView(person: person)
                self.personToPass = person
                self.spiner.stopAnimating()
                
            }
        }
        
    }
    
    func setUpView (person: Person) {
        
        nameTxt.text = person.name
        heightTxt.text = person.height
        massTxt.text = person.mass
        hairTxt.text = person.hair
        birthYearTxt.text = person.birthYear
        genderTxt.text = person.gender
        
        homeworldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        strashipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHomeworld" {
            
        if let destination = segue.destination as? HomeworldVC {
            destination.person = personToPass
            }
            
            
        } else if segue.identifier == "toVehicles" {
            
            if let destination = segue.destination as? VehiclesVC {
                destination.person = personToPass
            }
            
            
        } else if segue.identifier == "toStarships" {
            
            if let destination = segue.destination as? StarshipsVC {
                destination.person = personToPass
            }
            
            
        } else if segue.identifier == "toFilms" {
            
            if let destination = segue.destination as? Films {
                destination.person = personToPass
                
                
            }
            
            
        }
    }
    
    
}


