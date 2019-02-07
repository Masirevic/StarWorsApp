//
//  VehiclesVC.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/6/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController {
    
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var lenghtLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengers: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    
    
    
    
    let api = VehicleApi()
    var person: Person!
    var vehicleArray = [String]()
    var currentVehicle = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        vehicleArray = person.vehicleUrls
        nextBtn.isEnabled = vehicleArray.count > 1
        previousBtn.isEnabled = false
        guard let firstVehicle = vehicleArray.first else {return}
        getVehicle(url: firstVehicle)
        print(firstVehicle)
        
        
    }
    

    func getVehicle(url: String) {
        api.getVehicle(url: url) { (vehicle) in
          if let vehicle = vehicle {
            self.setUpView(vehicle: vehicle)
            }
        }
    }
    
    func setUpView (vehicle: Vehicle) {
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        lenghtLbl.text = vehicle.length
        crewLbl.text = vehicle.crew
        passengers.text = vehicle.passengers
        speed.text = vehicle.speed
    }
    
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        currentVehicle += 1
        setBtnState()
    }
    
    
    @IBAction func previousBtnClicked(_ sender: UIButton) {
        currentVehicle -= 1
        setBtnState()
    }
    
    func setBtnState () {
        
        
        nextBtn.isEnabled = (currentVehicle == vehicleArray.count - 1) ? false : true
        previousBtn.isEnabled = currentVehicle == 0 ? false : true
        
//        if currentVehicle == 0 {
//            previousBtn.isEnabled = false
//        } else {
//            previousBtn.isEnabled = true
//        }
//        
//
//        if currentVehicle == vehicleArray.count - 1 {
//            nextBtn.isEnabled = false
//        } else {
//            nextBtn.isEnabled = true
//        }
        
        getVehicle(url: vehicleArray[currentVehicle])
    }
    
}
