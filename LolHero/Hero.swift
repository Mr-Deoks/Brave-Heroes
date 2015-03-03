//
//  Hero.swift
//  LolHero
//
//  Created by Denis Aganin on 03.03.15.
//  Copyright (c) 2015 Potato Inc. All rights reserved.
//

import Foundation
import UIKit

class Hero {
    var health = 0
    var maxHealth = 0
    var damage = 0
    var armor = Armor()
    var name = ""
    var image = UIImage(named: "")
    var attackType = ""
    
}


class Warrior: Hero {
    
    override var armor: Armor {
        get {
            return Plate()
        }
        set {}
    }
}

class Rogue: Hero {
    
    override var armor: Armor {
        get {
            return Leather()
        }
        set {}
    }
}

class Mage: Hero {
    
    override var armor: Armor {
        get {
            return Cloth()
        }
        set {}
    }
}