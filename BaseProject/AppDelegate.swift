//
//  AppDelegate.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/26.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var lunch:UIView!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        setKeyWindow()
        
        setAppAppearance()
        
        //setShared()
        
        setAD()
        return true
    }
    func setAD(){
        //        let hashValve = "splashHashValue"
        //        NSUserDefaults.standardUserDefaults().setObject("dd", forKey: hashValve)
        //        NSUserDefaults.standardUserDefaults().synchronize()
        
        lunch = UIView(frame: CGRectMake(0, 0, self.window!.screen.bounds.size.width, self.window!.screen.bounds.size.height))
        self.window?.addSubview(lunch)
        
        var ADImage:UIImageView!
        ADImage = UIImageView(frame: CGRectMake(0, 0, self.window!.screen.bounds.size.width, self.window!.screen.bounds.size.height))
        let splashData = NSUserDefaults.standardUserDefaults().objectForKey(splashData_UserDefaults) as? NSData
        if splashData != nil{
            ADImage.image = UIImage(data: splashData!)
        }else{
            ADImage.image = UIImage(named: "welcome00")
        }
        
        lunch.addSubview(ADImage)
        
        //let timer: NSTimer?
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "changeBtn", userInfo: nil, repeats: false)
    }
    func changeBtn(){
        lunch.removeFromSuperview()
    }
    func setKeyWindow() {
        window = UIWindow(frame: MainBounds)
        
        window?.rootViewController = showLeadpage()
        
        window?.makeKeyAndVisible()
    }
    
    //MARK: - 引导页设置
    func showLeadpage() -> UIViewController {
        let versionStr = "CFBundleShortVersionString"
        let cureentVersion = NSBundle.mainBundle().infoDictionary![versionStr] as! String
        let oldVersion = (NSUserDefaults.standardUserDefaults().objectForKey(versionStr) as? String) ?? ""
        
        if cureentVersion.compare(oldVersion) == NSComparisonResult.OrderedDescending {
            NSUserDefaults.standardUserDefaults().setObject(cureentVersion, forKey: versionStr)
            NSUserDefaults.standardUserDefaults().synchronize()
            return leadViewController()
        }
        //        if !UserAccountTool.userIsLogin() {
        //            return LoginViewController()
        //        }else{
        //            return MainTabBarController()
        //        }
        
        return MainTabBarController()
    }
    //MARK: - 分享设置
    func setAppAppearance() {
        let itemAppearance = UITabBarItem.appearance()
        itemAppearance.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.blackColor(), NSFontAttributeName : UIFont.systemFontOfSize(14)], forState: .Selected)
        itemAppearance.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.grayColor(), NSFontAttributeName : UIFont.systemFontOfSize(12)], forState: .Normal)
        
        //设置导航栏主题
        let navAppearance = UINavigationBar.appearance()
        // 设置导航titleView字体
        navAppearance.translucent = false
        navAppearance.titleTextAttributes = [NSFontAttributeName : theme.WZLNavTitleFont, NSForegroundColorAttributeName : UIColor.blackColor()]
        //navAppearance.barTintColor = theme.YKTNavigationColor
        
        let item = UIBarButtonItem.appearance()
        item.setTitleTextAttributes([NSFontAttributeName : theme.WZLNavItemFont, NSForegroundColorAttributeName : UIColor.blueColor()], forState: .Normal)
        
    }
    
//    func setShared() {
//        UMSocialData.setAppKey(theme.UMSharedAPPKey)
//        //        UMSocialSinaHandler.openSSOWithRedirectURL("http://weibo.com/u/5064368161/home?wvr=5&lf=reg")
//        UMSocialSinaHandler.openSSOWithRedirectURL(nil)
//        UMSocialWechatHandler.setWXAppId("wxd8e41a9f164e6294", appSecret: "620c662bf524131f16e7f70594e4af3b", url: theme.JianShuURL)
//        UMSocialConfig.hiddenNotInstallPlatforms([UMShareToWechatSession,UMShareToWechatTimeline])
//    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

