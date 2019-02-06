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
    var randomNumber: Int!
    
    
    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var heightTxt: UILabel!
    @IBOutlet weak var massTxt: UILabel!
    @IBOutlet weak var hairTxt: UILabel!
    @IBOutlet weak var birthYearTxt: UILabel!
    @IBOutlet weak var genderTxt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func randomClicked(_ sender: Any) {
        
        randomNumber = Int.random(in: 1...87)
        
        personApi.getRandomAlamo(n: randomNumber) { (person) in
            if let person = person {
                self.nameTxt.text = person.name
                self.heightTxt.text = person.height
                self.massTxt.text = person.mass
                self.hairTxt.text = person.hair
                self.birthYearTxt.text = person.birthYear
                self.genderTxt.text = person.gender
                
            }
        }
        
    }
}

