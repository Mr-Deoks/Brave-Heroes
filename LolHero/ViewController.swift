//
//  ViewController.swift
//  LolHero
//
//  Created by Denis Aganin on 03.03.15.
//  Copyright (c) 2015 Potato Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var consoleLabel: UILabel!
    @IBOutlet weak var heroHealthLabel: UILabel!
    @IBOutlet weak var enemyHealthLabel: UILabel!
    @IBOutlet weak var heroDamageLabel: UILabel!
    @IBOutlet weak var enemyDamageLabel: UILabel!
    @IBOutlet weak var heroArmorLabel: UILabel!
    @IBOutlet weak var topButtonLabel: UILabel!
    @IBOutlet weak var midButtonLabel: UILabel!
    @IBOutlet weak var bottomButtonLabel: UILabel!
    
    
    // Variables
    var heroesArray: [Hero] = []
    var chosenHero = Hero()
    var enemiesArray: [Enemy] = []
    var chosenEnemy = Enemy()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        defineHeroes()
        
    }

    
    //Buttons
    
    @IBAction func topButtonAction(sender: AnyObject) {
        if topButtonLabel.text == "Warrior" {
        chooseWarrior()
        defineEnemies()
        } else if topButtonLabel.text == "Spider" {
            chooseSpider()
            startCombat()
        } else if topButtonLabel.text == "Attack!" {
            attack()
        }
    }
    
    @IBAction func midButtonAction(sender: AnyObject) {
        if topButtonLabel.text == "Warrior" {
            chooseRogue()
            defineEnemies()
        } else if topButtonLabel.text == "Spider" {
            chooseTroll()
            startCombat()
        } else if topButtonLabel.text == "Attack!" {
            bandages()
        }
    }
    
    @IBAction func bottomButtonAction(sender: AnyObject) {
        if topButtonLabel.text == "Warrior" {
            chooseMage()
            defineEnemies()
        } else if topButtonLabel.text == "Spider" {
            chooseDragon()
            startCombat()
        } else if topButtonLabel.text == "Attack!" {
            retreat()
        }
    }
    
    
    
    
    //Combat functions:
    
    //Start combat
    
    func startCombat() {
        topButtonLabel.text = "Attack!"
        midButtonLabel.text = "Bandages!"
        bottomButtonLabel.text = "Retreat!"
        instructionLabel.text = "The battle has begun!"
        consoleLabel.text = "Choose what your hero will do."
    }
    
    //Dealing damage
    
    func attack() {
        if	 topButtonLabel.text == "Attack!" {
            var damageReducedByArmor = chosenEnemy.damage - chosenHero.armor.defense
            self.chosenEnemy.health -= chosenHero.damage
            self.chosenHero.health -= damageReducedByArmor
            heroHealthLabel.text = String(chosenHero.health)
            enemyHealthLabel.text = String(chosenEnemy.health)
            instructionLabel.text = "Chaaarge! Choose your next action!"
            consoleLabel.text = "You have chosen to attack. \(chosenHero.name) strikes \(chosenEnemy.name) with \(chosenHero.attackType) and deals \(chosenHero.damage) damage. \(chosenEnemy.name) strikes \(chosenHero.name) and deals \(chosenEnemy.damage) damage."
            if chosenEnemy.health <= 0 {
                performSegueWithIdentifier("Victory", sender: nil)
            }
            if chosenHero.health <= 0 {
                performSegueWithIdentifier("GameOver", sender: nil)
            }
        }
    }
    func bandages() {
        if midButtonLabel.text == "Bandages!" {
            var damageReducedByArmor = chosenEnemy.damage - chosenHero.armor.defense
            self.chosenHero.health -= damageReducedByArmor
            if (chosenHero.health + 10) <= chosenHero.maxHealth {
              self.chosenHero.health += 10
            } else if (chosenHero.health + 10) > chosenHero.maxHealth {
                self.chosenHero.health = chosenHero.maxHealth
            }
            heroHealthLabel.text = String(chosenHero.health)
            instructionLabel.text = "Healing! Choose your next action!"
            consoleLabel.text = "You have chosen to apply bandages. \(chosenHero.name) uses some bandages and his health are restored to \(chosenHero.health). \(chosenEnemy.name) strikes \(chosenHero.name) and deals \(chosenEnemy.damage) damage."
            if chosenHero.health <= 0 {
                performSegueWithIdentifier("GameOver", sender: nil)
            }
        }
    }
    func retreat() {
            performSegueWithIdentifier("GameOver", sender: nil)
    }
    
    
    
    //Choosing functions:
    
    //Choosing the enemy
    
    func chooseSpider() {
        if topButtonLabel.text == "Spider" {
            chosenEnemy = enemiesArray[0]
            instructionLabel.text = "Enemy is chosen!"
            consoleLabel.text = "You have chosen a \(chosenEnemy.name)! Let the battle begin!"
            enemyHealthLabel.text = String(chosenEnemy.health)
            enemyDamageLabel.text = String(chosenEnemy.damage)
            imageView.image = chosenEnemy.image
        }
    }
    func chooseTroll() {
        if midButtonLabel.text == "Troll" {
            chosenEnemy = enemiesArray[1]
            instructionLabel.text = "Enemy is chosen!"
            consoleLabel.text = "You have chosen a \(chosenEnemy.name)! Let the battle begin!"
            enemyHealthLabel.text = String(chosenEnemy.health)
            enemyDamageLabel.text = String(chosenEnemy.damage)
            imageView.image = chosenEnemy.image
        }
    }
    func chooseDragon() {
        if bottomButtonLabel.text == "Dragon" {
            chosenEnemy = enemiesArray[2]
            instructionLabel.text = "Enemy is chosen!"
            consoleLabel.text = "You have chosen a \(chosenEnemy.name)! Let the battle begin!"
            enemyHealthLabel.text = String(chosenEnemy.health)
            enemyDamageLabel.text = String(chosenEnemy.damage)
            imageView.image = chosenEnemy.image
        }
    }
    
    //Choosing the hero
    
    func chooseWarrior() {
        if topButtonLabel.text == "Warrior" {
            chosenHero = heroesArray[0]
            instructionLabel.text = "Now choose your enemy!"
            consoleLabel.text = "Hero is chosen! You have chosen mighty \(chosenHero.name)!"
            heroHealthLabel.text = String(chosenHero.health)
            heroDamageLabel.text = String(chosenHero.damage)
            heroArmorLabel.text = String(chosenHero.armor.defense)
            imageView.image = chosenHero.image
        }
    }
    func chooseRogue() {
        if midButtonLabel.text == "Rogue" {
            chosenHero = heroesArray[1]
            instructionLabel.text = "Now choose your enemy!"
            consoleLabel.text = "Hero is chosen! You have chosen sinister \(chosenHero.name)!"
            heroHealthLabel.text = String(chosenHero.health)
            heroDamageLabel.text = String(chosenHero.damage)
            heroArmorLabel.text = String(chosenHero.armor.defense)
            imageView.image = chosenHero.image
        }
    }
    func chooseMage() {
        if bottomButtonLabel.text == "Mage" {
            chosenHero = heroesArray[2]
            instructionLabel.text = "Now choose your enemy!"
            consoleLabel.text = "Hero is chosen! You have chosen wise \(chosenHero.name)!"
            heroHealthLabel.text = String(chosenHero.health)
            heroDamageLabel.text = String(chosenHero.damage)
            heroArmorLabel.text = String(chosenHero.armor.defense)
            imageView.image = chosenHero.image
        }
    }
    
    
    //Defining functions:
    
    //Defining enemies
    func defineEnemies() {
        
        let spider = Enemy()
        spider.name = "Forest Spider"
        spider.health = 500
        spider.damage = 22
        spider.image = UIImage(named: "spider.jpg")
        topButtonLabel.text = "Spider"
        enemiesArray.append(spider)
        
        let troll = Enemy()
        troll.name = "Mountain Troll"
        troll.health = 800
        troll.damage = 24
        troll.image = UIImage(named: "troll.jpg")
        midButtonLabel.text = "Troll"
        enemiesArray.append(troll)
        
        let dragon = Enemy()
        dragon.name = "Rust Dragon"
        dragon.health = 1000
        dragon.damage = 26
        dragon.image = UIImage(named: "dragon.jpg")
        bottomButtonLabel.text = "Dragon"
        enemiesArray.append(dragon)
    }
    
    //Defining heroes' classes
    func defineHeroes() {
        
        instructionLabel.text = "Choose your hero!"
        consoleLabel.text = "Choose among the three classes below."
        
        let warrior = Warrior()
        warrior.name = "Bjorngar"
        warrior.damage = 20
        warrior.health = 100
        warrior.maxHealth = 100
        warrior.attackType = "a metal axe"
        warrior.image = UIImage(named: "warrior.jpg")
        heroesArray.append(warrior)
        topButtonLabel.text = "Warrior"
        
        let rogue = Rogue()
        rogue.name = "Auriate"
        rogue.damage = 75
        rogue.health = 60
        rogue.maxHealth = 60
        rogue.attackType = "a pair of daggers"
        rogue.image = UIImage(named: "rogue.jpg")
        heroesArray.append(rogue)
        midButtonLabel.text = "Rogue"
        
        let mage = Mage()
        mage.name = "Salardikus"
        mage.damage = 120
        mage.health = 30
        mage.maxHealth = 30
        mage.attackType = "a scorching fireball"
        mage.image = UIImage(named: "mage.jpg")
        heroesArray.append(mage)
        bottomButtonLabel.text = "Mage"
        
        
    }
}

