//
//  ViewController.swift
//  H2Radio
//
//  Created by Lance on 15/9/16.
//  Copyright © 2015年 Lance. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var player = STKAudioPlayer()
    var avPlayer = AVAudioPlayer()
    
    static var isFirst = true
    
    //    let fileURL: NSURL = NSBundle.mainBundle().URLForResource("Hotel California", withExtension: "mp3")!
    var url: NSURL = NSURL(string: "http://m2.music.126.net/ru4rRgSHFFixWfQZVtPSMQ==/3249056861081712.mp3")!
    
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        //url = NSURL(string: "http://183.134.10.66/ws.cdn.baidupcs.com/file/9f6c472e548827c2b6960ed7bf8adb9f?bkt=p2-qd-252&xcode=b6e01fa17f16a7122fcd00fb35f0b6b986b757bdea1cf7417f42c5f191c19e11&fid=525543503-250528-841756790797736&time=1442216460&sign=FDTAXGERLBH-DCb740ccc5511e5e8fedcff06b081203-0h6iVO0zwUiLCqhKwoXHlW5B%2FwM%3D&to=lc&fm=Nan,B,T,t&sta_dx=6&sta_cs=1734&sta_ft=mp3&sta_ct=5&fm2=Nanjing,B,T,t&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=14009f6c472e548827c2b6960ed7bf8adb9fa0342dba0000006543ba&sl=70123598&expires=8h&rt=sh&r=243910084&mlogid=1309926953&vuk=-&vbdid=3476527488&fin=Hotel%20California.mp3&slt=pm&uta=0&rtype=1&iv=0&isw=0&dp-logid=5952518834906830954&dp-callid=0.1&wshc_tag=0&wsts_tag=55f67a0c&wsid_tag=b7364085&wsiphost=ipdbm")!
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        do {
//            self.avPlayer = try AVAudioPlayer(data: data!)
//            self.avPlayer.delegate = self
//            self.avPlayer.prepareToPlay()
//            self.avPlayer.volume = 1.0
//        } catch {
//            print(error)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        print("start...")
    }
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer, error: NSError?) {
        print("stop...")
    }
    
    @IBAction func toggleButton_touch(sender: AnyObject) {
//        let soundID: SystemSoundID = 1001
//        AudioServicesPlaySystemSound(soundID)
//        if self.avPlayer.playing {
//            self.avPlayer.pause()
//            sender.setTitle("Play", forState: .Normal)
//        } else {
//            self.avPlayer.play()
//            sender.setTitle("Pause", forState: .Normal)
//        }
        if self.player.state == STKAudioPlayerStateReady || self.player.state == STKAudioPlayerStateStopped {
            self.player.playURL(self.url)
            playButton.setTitle("Pause", forState: .Normal)
        } else if (self.player.state == STKAudioPlayerStatePaused) {
            self.player.resume()
            playButton.setTitle("Pause", forState: .Normal)
        } else if self.player.state == STKAudioPlayerStatePlaying {
            self.player.pause()
            playButton.setTitle("Play", forState: .Normal)
        }
    }
    
    @IBAction func stopButton_touch(sender: AnyObject) {
//        self.avPlayer.stop()
//        self.avPlayer.currentTime = 0
        self.player.resume()
        self.player.stop()
        self.playButton.setTitle("Play", forState: .Normal)
    }

}

