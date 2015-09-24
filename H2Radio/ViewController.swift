//
//  ViewController.swift
//  H2Radio
//
//  Created by Lance on 15/9/16.
//  Copyright © 2015年 Lance. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, MusicServiceDelegate {

    var player = STKAudioPlayer()
    var avPlayer = AVAudioPlayer()
    
    static var isFirst = true
    
    //    let fileURL: NSURL = NSBundle.mainBundle().URLForResource("Hotel California", withExtension: "mp3")!
    var url: NSURL = NSURL(string: "http://m2.music.126.net/ru4rRgSHFFixWfQZVtPSMQ==/3249056861081712.mp3")!
    
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var musicIdTextField: UITextField!
    @IBOutlet weak var musicLyricTextView: UITextView!
    
    var musicService = MusicService()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.musicService.delegate = self
    }
    
    deinit {
        self.musicService.delegate = nil
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
            self.musicService.musicDetail(self.musicIdTextField.text!)
        } else if (self.player.state == STKAudioPlayerStatePaused) {
            self.player.resume()
            self.playButton.setTitle("Pause", forState: .Normal)
        } else if self.player.state == STKAudioPlayerStatePlaying {
            self.player.pause()
            self.playButton.setTitle("Play", forState: .Normal)
        }
    }
    
    @IBAction func stopButton_touch(sender: AnyObject) {
//        self.avPlayer.stop()
//        self.avPlayer.currentTime = 0
        self.player.resume()
        self.player.stop()
        self.playButton.setTitle("Play", forState: .Normal)
    }
    
    @IBAction func apiButton_touch(sender: AnyObject) {
        self.musicService.musicLyric(self.musicIdTextField.text!)
    }
    
    func didReceiveMusicInfo(musicInfo: String?) {
        if musicInfo != nil {
//            self.player.playURL(self.url)
            self.player.playURL(NSURL(string: musicInfo!))
            self.playButton.setTitle("Pause", forState: .Normal)
            
            self.musicService.musicLyric(self.musicIdTextField.text!)
        }
    }
    
    func didReceiveMusicLyric(musicLyric: String?) {
        if musicLyric != nil {
            do {
                let regular = try NSRegularExpression(pattern: "\\[.*\\]", options: .CaseInsensitive)
                let range = NSMakeRange(0, musicLyric!.characters.count)
                self.musicLyricTextView.text = regular.stringByReplacingMatchesInString(musicLyric!, options: .ReportProgress, range: range, withTemplate: "")
            } catch {
                print(error)
            }
        }
    }
}

