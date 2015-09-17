//
//  ArtistAlbumService.swift
//  H2Radio
//
//  Created by Lance on 15/9/15.
//  Copyright © 2015年 Lance. All rights reserved.
//

class ArtistAlbumService: ArtistService {
    
    class func artistAlbumAPI(artistId: String, limit: Int) -> String {
        return netEaseMusicAPI + "/song/detail/?id=" + artistId + "?limit=" + String(limit < 0 ? 0 : limit)
    }
    
    class func artistAlbumAllAPI(artistId: String) -> String {
        return super.artistAPI(artistId)
    }
    
    override class func artistAPI(artistId: String) -> String {
        return artistAlbumAPI(artistId, limit: 0)
    }
}
