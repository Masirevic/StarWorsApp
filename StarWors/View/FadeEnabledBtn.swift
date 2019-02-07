//
//  FadeEnabledBtn.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/6/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import UIKit



class FadeEnabledBtn: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.4) {
                  self.alpha = 1.0
                }
                
            } else {
                UIView.animate(withDuration: 0.4) {
                     self.alpha = 0.4
                }
               
            }
            
        }
    }
    
}
