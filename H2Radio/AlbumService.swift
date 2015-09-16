//
//  AlbumService.swift
//  H2Radio
//
//  Created by Lance on 15/9/15.
//  Copyright © 2015年 Soul. All rights reserved.
//

class AlbumService: BaseService {

    class func albumAPI(albumId: String) -> String {
        return netEaseMusicAPI + "/album/" + albumId
    }
}
