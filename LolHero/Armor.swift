//
//  Armor.swift
//  LolHero
//
//  Created by Denis Aganin on 03.03.15.
//  Copyright (c) 2015 Potato Inc. All rights reserved.
//

import Foundation

class Armor {
    
    var defense = 0
}

class Plate: Armor {
    
    override var defense: Int {
        get {
            return 20
        }
        set {}
    }
    
}
    class Leather: Armor {
    
        override var defense: Int {
            get {
                return 18
            }
            set {}
        }
    }
    
    class Cloth: Armor {
        
        override var defense: Int {
            get {
                return 17
            }
            set {}
        }
}

