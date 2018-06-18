//
//  ParkView.swift
//  Crawick App
//
//  Created by Steven Gibson on 13/04/2018.
//  Copyright © 2018 Steven Gibson. All rights reserved.
//

import UIKit
import AVFoundation

class ParkViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var audioPlayer2 = AVAudioPlayer()
    let Location1 = Bundle.main.path(forResource: "Audio Files/Location1", ofType: "wav")
    let Location2 = Bundle.main.path(forResource: "Audio Files/Location2", ofType: "wav")
    let Location3 = Bundle.main.path(forResource: "Audio Files/Location3", ofType: "wav")
    let Location4 = Bundle.main.path(forResource: "Audio Files/Location4", ofType: "wav")
    let Location5 = Bundle.main.path(forResource: "Audio Files/Location5", ofType: "wav")
    let Location6 = Bundle.main.path(forResource: "Audio Files/Location6", ofType: "wav")
    let Location7 = Bundle.main.path(forResource: "Audio Files/Location7", ofType: "wav")
    let Location8 = Bundle.main.path(forResource: "Audio Files/Location8", ofType: "wav")
    let Location9 = Bundle.main.path(forResource: "Audio Files/Location9", ofType: "wav")
    let Locatio10 = Bundle.main.path(forResource: "Audio Files/Location10", ofType: "wav")
    let Location11 = Bundle.main.path(forResource: "Audio Files/Location11", ofType: "wav")
    let Location12 = Bundle.main.path(forResource: "Audio Files/Location12", ofType: "wav")
    let Location13 = Bundle.main.path(forResource: "Audio Files/Location13", ofType: "wav")
    let Location14 = Bundle.main.path(forResource: "Audio Files/Location14", ofType: "wav")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BtnEntrance(_ sender: Any) {
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Location1! ))
            audioPlayer2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Location2! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
        
        
    }
    
    @IBAction func BtnLocation2(_ sender: Any) {
    }
    
    @IBAction func BtnLocation3(_ sender: Any) {
    }
    
    @IBAction func BtnLocation4(_ sender: Any) {
    }
    
    @IBAction func BtnLocation6(_ sender: Any) {
    }
    @IBAction func BtnLocation7(_ sender: Any) {
    }
    
    @IBAction func BtnLocation9(_ sender: Any) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Location9! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
}
