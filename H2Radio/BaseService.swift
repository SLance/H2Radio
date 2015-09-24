//
//  BaseService.swift
//  H2Radio
//
//  Created by Lance on 15/9/11.
//  Copyright © 2015年 Lance. All rights reserved.
//

typealias blockSuccess = (data: AnyObject?) -> Void

class BaseService: NSObject {

    static let netEaseMusicWebSite = "http://music.163.com/"
    static let netEaseMusicAPI = netEaseMusicWebSite + "api"
    
    var delegate: ServiceDelegate?
    
    func requestAPI(apiURL: String, success: blockSuccess) {
        let url = NSURL(string: apiURL)!
        let request = NSMutableURLRequest(URL: url)
        request.addValue(BaseService.netEaseMusicWebSite, forHTTPHeaderField: "Referer")
        
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if error == nil {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.delegate?.didReceiveData?(data!)
                        success(data: json)
                    })
                } catch {
                    print(error)
                }
            } else {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.delegate?.didReceiveFailed?(error!)
                })
            }
        }).resume()
    }
}

@objc protocol ServiceDelegate: NSObjectProtocol {
    
    optional func didReceiveData(data: AnyObject)
    
    optional func didReceiveFailed(error: NSError)
}
