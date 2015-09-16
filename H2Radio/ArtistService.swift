//
//  ArtistService.swift
//  H2Radio
//
//  Created by Lance on 15/9/15.
//  Copyright © 2015年 Soul. All rights reserved.
//

class ArtistService: BaseService {

    class func artistAPI(artistId: String) -> String {
        return netEaseMusicAPI + "/artist/" + artistId
    }
}
