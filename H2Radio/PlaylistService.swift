//
//  PlaylistService.swift
//  H2Radio
//
//  Created by Lance on 15/9/15.
//  Copyright © 2015年 Soul. All rights reserved.
//

class PlaylistService: BaseService {

    class func playlistDetailAPI(playlistId: String) -> String {
        return netEaseMusicAPI + "/playlist/detail?id=" + playlistId
    }
}
