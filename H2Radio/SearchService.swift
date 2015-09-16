//
//  SearchService.swift
//  H2Radio
//
//  Created by Lance on 15/9/15.
//  Copyright © 2015年 Soul. All rights reserved.
//

class SearchService: BaseService {

    class func searchAPI() -> String {
        return netEaseMusicAPI + "/search/pc"
    }
}
