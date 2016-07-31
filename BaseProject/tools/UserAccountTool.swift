//
//  UserAccountTool.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/27.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit

class UserAccountTool: NSObject {
    class func getUserDefaults() -> NSUserDefaults{
        let user = NSUserDefaults.standardUserDefaults()
        return user
    }
    class func getInfomation() {
        //http://www.haihuogo.com/app/my/information?rqsJson={}&sign=123456789
        let url = NSURL(string: YKTUrl+"my/information?rqsJson=%7B%7D"+YKTSign)
        print(url)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        request.timeoutInterval = 5
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) { (response, data, e) -> Void in
            dispatch_async(dispatch_get_main_queue(),{
                if data != nil {
                    let dict:NSDictionary!
                    do{
                        dict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                        let rst = dict.objectForKey("rst") as! Int
                        if rst == 0 {
                            let rspJson = dict.objectForKey("rspJson") as! NSDictionary
                            let tag = rspJson.objectForKey("tag") as! String
                            NSUserDefaults.standardUserDefaults().setObject(tag, forKey: tag_UserDefaults)
                        }
                    }catch{
                        
                    }
                }
            })
        }
        
    }
    //重新登录
    class func reLogin() -> Bool {
        if userIsLogin(){
            let u = userAccount()
            let p = userHavePwd()
            let pstr:String = u!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLUserAllowedCharacterSet())!
            let pwdstr:String = p!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLUserAllowedCharacterSet())!
            let url = NSURL(string: YKTUrl+"customer/login_validate?rqsJson=%7B%22loginName%22:%22"+pstr+"%22,%22pwd%22:%22"+pwdstr+"%22%7D"+YKTSign)
            print(url)
            let request = NSMutableURLRequest(URL: url!)
            request.HTTPMethod = "POST"
            request.timeoutInterval = 5
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) { (response, data, e) -> Void in
                dispatch_async(dispatch_get_main_queue(),{
                    if data != nil && data?.length != 0 {
                        print("&&&&&")
                        let session = getCookies.GetCookieByName("JSESSIONID")
                        print(session)
                        print(getCookies.GetCookieArray())
                        print("&&&&&")
                        NSUserDefaults.standardUserDefaults().setObject(session, forKey: JSESSION)
                    }
                })
            }
            return true
        }else{
            return false
        }
    }
    
    // 判断当前用户是否绑定卡
    class func cardIsBinding() -> Bool {
        let user = NSUserDefaults.standardUserDefaults()
        let account = user.objectForKey(cardBinding_UserDefaults) as? Int
        
        if account == 9 {
            return true
        }else{
            return false
        }
    }
    // 判断当前用户是否登录
    class func userIsLogin() -> Bool {
        let user = NSUserDefaults.standardUserDefaults()
        let account = user.objectForKey(YKT_UserDefaults_Account) as? String
        let password = user.objectForKey(SD_UserDefaults_Password) as? String
        
        if account != nil && password != nil {
            if !account!.isEmpty && !password!.isEmpty {
                return true
            }
        }
        return false
    }
    
    // 判断当前用户是否登录过，再次登录不用填写用户名密码
    class func userHaveLogin() -> Bool {
        let user = NSUserDefaults.standardUserDefaults()
        let account = user.objectForKey(YKT_UserDefaults_Account) as? String
        let password = user.objectForKey(YKT_UserDefaults_Password) as? String
        
        if account != nil && password != nil {
            if !account!.isEmpty && !password!.isEmpty {
                return true
            }
        }
        return false
    }
    
    // 如果用户登录了,返回用户的账号(电话号)
    class func userAccount() -> String? {
        if !userIsLogin() {
            return nil
        }
        
        let user = NSUserDefaults.standardUserDefaults()
        let account = user.objectForKey(SD_UserDefaults_Account) as? String
        return account!
    }
    
    /// 如果用户登录过了,返回用户的账号(电话号)
    class func userHaveAccount() -> String? {
        if !userHaveLogin() {
            return nil
        }
        
        let user = NSUserDefaults.standardUserDefaults()
        let account = user.objectForKey(YKT_UserDefaults_Account) as? String
        return account!
    }
    /// 如果用户登录过了,返回用户的密码
    class func userHavePwd() -> String? {
        if !userHaveLogin() {
            return nil
        }
        
        let user = NSUserDefaults.standardUserDefaults()
        let pwd = user.objectForKey(YKT_UserDefaults_Password) as? String
        return pwd!
    }
}
