//
//  BlackBgView.swift
//  StarWors
//
//  Created by Ljubomir Masirevic on 2/5/19.
//  Copyright © 2019 Ljubomir Masirevic. All rights reserved.
//

import UIKit


class BlackBgView: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        layer.backgroundColor = BLACK_BG
    }
    
    
}



