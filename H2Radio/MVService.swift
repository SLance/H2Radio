//
//  MVService.swift
//  H2Radio
//
//  Created by Lance on 15/9/15.
//  Copyright © 2015年 Lance. All rights reserved.
//

class MVService: BaseService {

    class func mvDetailAPI(mvId: String) -> String {
        return netEaseMusicAPI + "/mv/detail?id=" + mvId + "&type=mp4"
    }
}
