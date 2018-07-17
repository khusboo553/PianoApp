//
//  ViewController.swift
//  PianoApp
//
//  Created by GLB-311-PC on 14/07/18.
//  Copyright © 2018 Globussoft. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var C3Button: UIButton!
    @IBOutlet weak var DButton: UIButton!
    @IBOutlet weak var EButton: UIButton!
    @IBOutlet weak var FButton: UIButton!
    @IBOutlet weak var GButton: UIButton!
    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var BButton: UIButton!
    @IBOutlet weak var C4Button: UIButton!
    
    @IBOutlet weak var CeButton: UIButton!
    @IBOutlet weak var DeButton: UIButton!
    @IBOutlet weak var FeButton: UIButton!
     @IBOutlet weak var GeButton: UIButton!
     @IBOutlet weak var AeButton: UIButton!
    
    var buttons = [UIButton]()
    var lastActiveButton:UIButton?

    let pianoKeys = ["C3", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B", "C4"]
    var audioPlayers:[AVAudioPlayer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        C3Button.layer.borderColor=UIColor.black.cgColor
        C3Button.layer.borderWidth=1
        let panGesture0 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        C3Button.addGestureRecognizer(panGesture0)
        buttons.append(C3Button)
       
        DButton.layer.borderColor=UIColor.black.cgColor
        DButton.layer.borderWidth=1
        let panGesture1 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        DButton.addGestureRecognizer(panGesture1)
        buttons.append(DButton)
        
        EButton.layer.borderColor=UIColor.black.cgColor
        EButton.layer.borderWidth=1
        let panGesture2 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        EButton.addGestureRecognizer(panGesture2)
        buttons.append(EButton)
        
        FButton.layer.borderColor=UIColor.black.cgColor
        FButton.layer.borderWidth=1
        let panGesture3 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        FButton.addGestureRecognizer(panGesture3)
        buttons.append(FButton)
        
        GButton.layer.borderColor=UIColor.black.cgColor
        GButton.layer.borderWidth=1
        let panGesture4 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        GButton.addGestureRecognizer(panGesture4)
        buttons.append(GButton)
        
        AButton.layer.borderColor=UIColor.black.cgColor
        AButton.layer.borderWidth=1
        let panGesture5 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
         AButton.addGestureRecognizer(panGesture5)
        buttons.append(AButton)
        
        BButton.layer.borderColor=UIColor.black.cgColor
        BButton.layer.borderWidth=1
        let panGesture6 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        BButton.addGestureRecognizer(panGesture6)
        buttons.append(BButton)
        
        C4Button.layer.borderColor=UIColor.black.cgColor
        C4Button.layer.borderWidth=1
        let panGesture7 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        C4Button.addGestureRecognizer(panGesture7)
        buttons.append(C4Button)
        
        let panGesture8 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        CeButton.addGestureRecognizer(panGesture8)
        buttons.append(CeButton)
        let panGesture9 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        DeButton.addGestureRecognizer(panGesture9)
        buttons.append(DeButton)
        let panGesture10 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        FeButton.addGestureRecognizer(panGesture10)
        buttons.append(FeButton)
        let panGesture11 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        GeButton.addGestureRecognizer(panGesture11)
        buttons.append(GeButton)
        let panGesture12 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        AeButton.addGestureRecognizer(panGesture12)
        buttons.append(AeButton)
        
        for key in pianoKeys {
            
            let pianoSoundURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: key, ofType: "mp3")!)
           
            let audioPlayer = try! AVAudioPlayer(contentsOf: pianoSoundURL as URL)
//            let audioPlayer = AVAudioPlayer(contentsOfURL: pianoSoundURL, error: nil)
            audioPlayer.prepareToPlay()
            audioPlayers.append(audioPlayer)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func panGesture(sender: UIPanGestureRecognizer){
        let touchPoint = sender.location(in: self.view)
        // Iterate through all the buttons
        for button in buttons {
            
            // Check area of the button against your touch
            if button.frame.contains(touchPoint) {
                
                // You are inside the touch area of the button
                // Here, you can for example perform some action if you want, store information
                // about the button so you don't do it multiple times etc.. your call :)
                self.lastActiveButton = button
            }
        }
        let keynum = self.lastActiveButton?.tag
        audioPlayers[keynum!].currentTime = 0
        audioPlayers[keynum!].play()
    }
    
    @IBAction func playSoundKey(_ sender: UIButton) {
        
        let keynum = sender.tag
        audioPlayers[keynum].currentTime = 0
        audioPlayers[keynum].play()
        
    }
   
}


