//
//  ViewController.swift
//  MusicSounds
//
//  Created by Shreya Bhatia on 17/05/18.
//  Copyright © 2018 Shreya Bhatia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    let soundFileNames = ["light-saber","swluke","swvader","yodalaughing"]
    
    var audioPlayers = [AVAudioPlayer]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        for sounds in soundFileNames {
            
            do {
                
                
                let ab = NSDataAsset(name: sounds)
                
                let audioPlayer = try AVAudioPlayer(data: (ab?.data)!, fileTypeHint: AVFileType.wav.rawValue)
//                let url = URL(fileURLWithPath: (Bundle.main.path(forResource: sounds, ofType: "wav"))!)
//
//                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                
                audioPlayers.append(audioPlayer)
            }
            
            catch {
                
                audioPlayers.append(AVAudioPlayer())
            }
            
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.play()
    }
}

