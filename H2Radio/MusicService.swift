//
//  MusicService.swift
//  H2Radio
//
//  Created by Lance on 15/9/11.
//  Copyright © 2015年 Soul. All rights reserved.
//

class MusicService: BaseService {

    class func musicDetailAPI(musicId: String) -> String {
        return netEaseMusicAPI + "/song/detail/?id=" + musicId + "&ids=%5B" + musicId + "%5D"
    }
    
    class func musicLyricAPI(musicId: String) -> String {
        return netEaseMusicAPI + "/song/lyric?os=pc&id=" + musicId + "&lv=-1&kv=-1&tv=-1"
    }
}
