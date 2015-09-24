//
//  MusicService.swift
//  H2Radio
//
//  Created by Lance on 15/9/11.
//  Copyright © 2015年 Lance. All rights reserved.
//

class MusicService: BaseService {

    class func musicDetailAPI(musicId: String) -> String {
        return netEaseMusicAPI + "/song/detail/?id=" + musicId + "&ids=%5B" + musicId + "%5D"
    }
    
    class func musicLyricAPI(musicId: String) -> String {
        return netEaseMusicAPI + "/song/lyric?os=pc&id=" + musicId + "&lv=-1&kv=-1&tv=-1"
    }
    
    func musicDetail(musicId: String) {
        let delegate = self.delegate as? MusicServiceDelegate
        self.requestAPI(MusicService.musicDetailAPI(musicId), success: { (data: AnyObject?) -> Void in
            let songs = (data as? NSDictionary)?["songs"] as? NSArray
            if songs?.count > 0 {
                let musicInfo = (songs?[0] as? NSDictionary)!
                let mp3Url = musicInfo["mp3Url"]
                delegate?.didReceiveMusicInfo?(mp3Url as? String)
            } else {
                delegate?.didReceiveMusicInfo?(nil)
            }
        })
    }
    
    func musicLyric(musicId: String) {
        let delegate = self.delegate as? MusicServiceDelegate
        self.requestAPI(MusicService.musicLyricAPI(musicId), success: { (data: AnyObject?) -> Void in
            let musicLyric = ((data as? NSDictionary)?["lrc"] as? NSDictionary)!["lyric"]
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                delegate?.didReceiveMusicLyric?(musicLyric as? String)
            })
        })
    }
}

@objc protocol MusicServiceDelegate : ServiceDelegate {
    
    optional func didReceiveMusicInfo(musicInfo: String?)
    
    optional func didReceiveMusicLyric(musicLyric: String?)
}
