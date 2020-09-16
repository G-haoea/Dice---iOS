//
//  ViewController.swift
//  Dice
//
//  Created by Grace Liu on 16/09/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var index = 0
    var curNum = 0
    var nextNum = 0
    
    var player : AVAudioPlayer!
    
    let diceArr = ["dice-1", "dice-2", "dice-3", "dice-4", "dice-5", "dice-6"]
    
    var indexArr = [0, 0, 0, 0, 0, 0]

    @IBOutlet weak var diceA: UIImageView!
    @IBOutlet weak var diceB: UIImageView!
    @IBOutlet weak var diceC: UIImageView!
    @IBOutlet weak var diceD: UIImageView!
    @IBOutlet weak var diceE: UIImageView!
    @IBOutlet weak var diceF: UIImageView!
    
    @IBOutlet weak var diceNumLabel: UILabel!

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var lessBtn: UIButton!
    
    @IBAction func rollBtn(_ sender: UIButton) {
        updateDices()
        
    }
    
    @IBAction func addDiceNumBtn(_ sender: UIButton) {
        //Update diceNumLabel
        updateDiceNum(direction: 1)
        
        //Update dice views
        updateDiceViews()
        
    }
    
    @IBAction func lessDiceNumBtn(_ sender: UIButton) {
        //Update diceNumLabel
        updateDiceNum(direction: 0)
        
        //Update dice views
        updateDiceViews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceA.isHidden = true
        
    }
    
    
    func updateDiceNum(direction: Int){
        //Calculate next number
        curNum = Int(diceNumLabel.text!)!
        nextNum = direction == 1 ? curNum + 1 : curNum - 1
        diceNumLabel.text = "\(nextNum)"
        
        //Update button state
        switch nextNum {
        case 6:
            addBtn.isHidden = true
        case 5:
            addBtn.isHidden = false
        case 2:
            lessBtn.isHidden = false
        case 1:
            lessBtn.isHidden = true
        default:
            break
        }
        
    }
    
    func updateDiceViews(){
        
        updateDices()
        
        switch nextNum {
        case 1:
            diceA.isHidden = false
            diceB.isHidden = true
            diceC.isHidden = true
            diceD.isHidden = true
            diceE.isHidden = true
            diceF.isHidden = true
        case 2:
            diceA.isHidden = true
            diceB.isHidden = false
            diceC.isHidden = false
            diceD.isHidden = true
            diceE.isHidden = true
            diceF.isHidden = true
        case 3:
            diceA.isHidden = false
            diceB.isHidden = true
            diceC.isHidden = true
            diceD.isHidden = false
            diceE.isHidden = true
            diceF.isHidden = false
        case 4:
            diceA.isHidden = true
            diceB.isHidden = false
            diceC.isHidden = false
            diceD.isHidden = false
            diceE.isHidden = true
            diceF.isHidden = false
        case 5:
            diceA.isHidden = true
            diceB.isHidden = false
            diceC.isHidden = false
            diceD.isHidden = false
            diceE.isHidden = false
            diceF.isHidden = false
        case 6:
            diceA.isHidden = false
            diceB.isHidden = false
            diceC.isHidden = false
            diceD.isHidden = false
            diceE.isHidden = false
            diceF.isHidden = false
        default:
            break
        }
        
        
        
    }
    

    func updateDices(){
        for index in 0...5{
            indexArr[index] = Int.random(in: 0...5)
        }
        
        playSound()
        
        diceA.image = UIImage(named: diceArr[indexArr[0]])
        diceB.image = UIImage(named: diceArr[indexArr[1]])
        diceC.image = UIImage(named: diceArr[indexArr[2]])
        diceD.image = UIImage(named: diceArr[indexArr[3]])
        diceE.image = UIImage(named: diceArr[indexArr[4]])
        diceF.image = UIImage(named: diceArr[indexArr[5]])
        
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "sound", withExtension: "wav")
        do{
            player = try AVAudioPlayer(contentsOf: url!)
            player.play()
        }catch{
            print(error)
        }
    }
    



}

