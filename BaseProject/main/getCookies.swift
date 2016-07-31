//
//  getCookies.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/27.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit

class getCookies: NSObject {
    /// 获取Cookie值
    class func GetCookieByName(let cookieName:String)->String?
    {
        let cookieArray:[NSHTTPCookie] = GetCookieArray()
        var value:String?
        if cookieArray.count > 0
        {
            for cookie in cookieArray
            {
                if cookie.name == cookieName
                {
                    value = cookie.value
                    break
                }
            }
        }
        return value
    }
    class func GetCookieArray()->[NSHTTPCookie]{
        
        let cookieStorage = GetCookieStorage()
        let cookieArray = cookieStorage.cookies
        if let _ = cookieArray{
            return cookieArray! as [NSHTTPCookie]
        }
        else{
            return []
        }
    }
    class func GetCookieStorage()->NSHTTPCookieStorage{
        return NSHTTPCookieStorage.sharedHTTPCookieStorage()
    }
}
