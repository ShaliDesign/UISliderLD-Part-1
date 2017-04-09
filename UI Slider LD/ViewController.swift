//
//  ViewController.swift
//  UI Slider LD
//
//  Created by Linh&ShawnD on 2017-04-02.
//  Copyright © 2017 Shali Design. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    
       var isPlay = true
       var timer = Timer()
    
    @IBOutlet weak var iSwitch: UISwitch!

    @IBOutlet weak var btn_play: UIButton!
    
    var audio = AVAudioPlayer()
    
    @IBOutlet weak var lbl_TimeLeft: UILabel!
    @IBOutlet weak var lbl_TimeTotal: UILabel!
    @IBOutlet weak var Sld_Duration: UISlider!

    @IBOutlet weak var sld_Volume: UISlider!
    
  
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        
        audio = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath:Bundle.main.path(forResource: "music", ofType:".mp3")!) as URL)
        audio.prepareToPlay()
        
        addThumbImgForSlider()
        
        iSwitch.addTarget(self, action: #selector(switchIsChange), for: UIControlEvents.valueChanged)
        audio.currentTime = 61.0
        
        audio.numberOfLoops = -1
        
        audio.delegate = self
        
//        let min: Int  = Int(audio.duration / 60)
//        let sec: Int = Int(audio.duration.truncatingRemainder(dividingBy: 60))
        
 
 
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLeft), userInfo: nil, repeats: true)
        
        
    btn_play.setImage(UIImage(named: "play.png"), for: UIControlState())
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
        
    
    

    
    
    func updateTimeLeft()
    {
        self.lbl_TimeLeft.text = String(format: "%2.2f", audio.currentTime/60)
        self.Sld_Duration.value = Float(audio.duration)
    
    }
    
    func switchIsChange(){

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
        
    }
    
    
    
    
    @IBAction func action_Play(_ sender: Any) {
       switchImage()
      isPlay = !isPlay
    }
   
    @IBAction func sld_Volume(_ sender: UISlider) {
        
        print(sender.value)
        
        audio.volume = (sender as AnyObject).value
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        print("Ket Thuc Bai Hat")
    }
    



}
