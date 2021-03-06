//
//  ViewController.swift
//  flagquiz
//
//  Created by Mihir Kelkar on 7/20/14.
//  Copyright (c) 2014 Mihir Kelkar. All rights reserved.
//


import UIKit



var flags : Dictionary<String,String> = ["Alaska" : "alaska.png",
    "Alabama" : "alabama.png",
    "Arizona" : "arizona.png",
    "Arkansas": "arkansas.png",
    "California" : "california.png",
    "Colorado" : "colorado.png",
    "Connecticut" : "connecticut.png",
    "Delaware":"delaware.png",
    "Florida" : "florida.png",
    "Georgia" : "georgia.png",
    "Hawaii" : "hawaii.png",
    "Idaho" : "idaho.png",
    "Illinois" : "illinois.png",
    "Indiana" : "indiana.png",
    "Iowa" : "iowa.png",
    "Kansas" : "kansas.png",
    "Kentucky":"kentucky.png",
    "Louisiana" : "louisiana.png",
    "Maine" : "maine.png",
    "Maryland" : "maryland.png",
    "Massachusetts" : "mass.png",
    "Michigan":"michigan.png",
    "Minessota" : "minnesota.png",
    "Mississippi" : "mississippi.png",
    "Missouri" : "missouri.png",
    "Montana" : "montana.png"
]

class ViewController: UIViewController {
    
    @IBOutlet var gameButton: UIButton
    @IBOutlet var options: UISegmentedControl
    @IBOutlet var flagView: UIImageView
    @IBOutlet var gameTitle: UILabel
    @IBOutlet var gameDesc: UITextView
    @IBOutlet var gameScore: UILabel
    var flagset = ""
    var correctanswer = ""
    var totalcorrect = 0
    var totalPlayed = 1
    
    var flagkeys = Array(flags.keys)
    @IBAction func startGame(sender: AnyObject) {
        gameDesc.hidden = true
        gameButton.hidden = true
        flagView.hidden = false
        options.hidden = false
        gameScore.hidden = false
        var counter:Int = 0
        var stateslist:String[] = []
        //This basically makes sure that all the choices geenrated as alternatives are different
        while(true)
        {
            var state = flagkeys[Int(arc4random() % 26)]
            if !find(stateslist, state){
                stateslist.append(state)
            }
            if stateslist.count == 4{
                break
            }
        }
        for ii in stateslist{
            options.setTitle(ii, forSegmentAtIndex: counter)
            counter++
        }
        
        correctanswer = stateslist[Int(arc4random() % 4)]
        println(correctanswer)
        println(flags[correctanswer])
        flagView.image = UIImage(named: flags[correctanswer])
    }
    
    func keepPlaying(){
        if totalPlayed < 11{
            totalPlayed += 1
            var counter:Int = 0
            options.selectedSegmentIndex = -1
            var stateslist:String[] = []
            //This basically makes sure that all the choices geenrated as alternatives are different
            while(true)
            {
                var state = flagkeys[Int(arc4random() % 26)]
                if !find(stateslist, state){
                    stateslist.append(state)
                    println(state)
                }
                if stateslist.count == 4{
                    break
                }
            }
            
            for ii in stateslist{
                options.setTitle(ii, forSegmentAtIndex: counter)
                counter++
            }
            correctanswer = stateslist[Int(arc4random() % 4)]
            println(correctanswer)
            println(flags[correctanswer])
            flagView.image = UIImage(named: flags[correctanswer])
        }
        else{
            viewDidLoad()
            
        }
    }
    
    @IBAction func selectOptions(sender: AnyObject) {
        if sender.titleForSegmentAtIndex(sender.selectedSegmentIndex) == correctanswer{
            println("Correct")
            totalcorrect += 1
            gameScore.text = "\(totalcorrect) correct"
        }
        
        keepPlaying()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        flagView.hidden = true
        options.hidden = true
        gameScore.hidden = true
        gameButton.hidden = false
        gameDesc.hidden = false
        totalcorrect = 0
        gameScore.text = "\(totalcorrect) correct"
        totalPlayed = 1
        options.selectedSegmentIndex = -1
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

