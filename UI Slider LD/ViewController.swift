//
//  ViewController.swift
//  UI Slider LD
//
//  Created by Linh&ShawnD on 2017-04-02.
//  Copyright © 2017 Shali Design. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    
       var isPlay = true

    @IBOutlet weak var btn_play: UIButton!
    
    var audio = AVAudioPlayer()
    

    @IBOutlet weak var sld_Volume: UISlider!
    
  
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
     
        
        audio = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath:Bundle.main.path(forResource: "music", ofType:".mp3")!) as URL)
        
        
    btn_play.setImage(UIImage(named: "play.png"), for: UIControlState())
        
        
        addThumbImgForSlider()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func addThumbImgForSlider()
    
    {

        sld_Volume.setThumbImage(UIImage(named: "thumb.png"), for: .normal)
        sld_Volume.setThumbImage(UIImage(named: "thumbHightLight.png"), for: .highlighted)
        
    }
    
    func switchImage()
    {
        if isPlay {
            audio.play()
            btn_play.setImage(UIImage(named: "pause.png"), for: UIControlState())
            
        } else {
            audio.pause()
           btn_play.setImage(UIImage(named: "play.png"), for: UIControlState())
          
           
        }
 
       //___________

        
        
        
        
        
        
    }
    
    
    
    
    @IBAction func action_Play(_ sender: Any) {
       switchImage()
      isPlay = !isPlay
    }
   
    @IBAction func sld_Volume(_ sender: UISlider) {
        
        print(sender.value)
        
        audio.volume = (sender as AnyObject).value
    }
    


}

