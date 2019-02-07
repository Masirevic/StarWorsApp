//
//  StarshipsVC.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/6/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController {

    let api = StarshipApi()
    var person: Person!
    var starshipArray = [String]()
    var currentStarship = 0
    
    
    
    
    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var modelLab: UILabel!
    @IBOutlet weak var speedLab: UILabel!
    @IBOutlet weak var crewLab: UILabel!
    @IBOutlet weak var lenghtLab: UILabel!
    @IBOutlet weak var passengersLab: UILabel!
    
    
    
    @IBOutlet weak var previousBtn: FadeEnabledBtn!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        starshipArray = person.starshipUrls
        
        previousBtn.isEnabled = false
        nextBtn.isEnabled = starshipArray.count > 1
        
        guard let firstStarship = starshipArray.first else {return}
        getStarship(url: firstStarship)
        
       
    }
    

    func getStarship (url: String) {
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.setUpView(starship: starship)
            }
        }
    }
    
    func setUpView (starship: Starships) {
           nameLab.text = starship.name
           modelLab.text = starship.model
           speedLab.text = starship.speed
           crewLab.text = starship.crew
           lenghtLab.text = starship.length
           passengersLab.text = starship.passengers
    }
    
    
    @IBAction func previousBtnClicked(_ sender: UIButton) {
        currentStarship -= 1
        setUpButtons()
    }
    
    
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        currentStarship += 1
        setUpButtons()
    }
    
    func setUpButtons () {
    
        nextBtn.isEnabled = (currentStarship == starshipArray.count - 1 ) ? false : true
        previousBtn.isEnabled = currentStarship == 0 ? false : true
        
        getStarship(url: starshipArray[currentStarship])
        
    }
    
    
}
