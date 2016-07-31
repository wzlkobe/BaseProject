//
//  theme.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/27.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit

//手机屏幕，宽，高
public let MainBounds: CGRect = UIScreen.mainScreen().bounds
public let AppWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
public let AppHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
//导航栏高度
public let NavigationH: CGFloat = 64

//URL头部跟签名，统一修改
public let YKTUrl: String = "http://www.haihuogo.com/app/"
//public let YKTUrl: String = "http://192.168.1.102:8080/app/"//本地ip
public let YKTSign: String = "&sign=123456789"

public let JSESSION = "JSESSION"

public let SD_UserLogin_Notification = "SD_UserLogin_Notification"
public let SD_UserDefaults_Account = "SD_UserDefaults_Account"

public let userName_UserDefaults = "userName_UserDefaults"
public let school_UserDefaults = "school_UserDefaults"
public let schoolID_UserDefaults = "schoolID_UserDefaults"
public let gender_UserDefaults = "gender_UserDefaults"
public let photo_UserDefaults = "photo_UserDefaults"
public let icon_UserDefaults = "icon_UserDefaults"
public let tag_UserDefaults = "tag_UserDefaults"
public let cardBinding_UserDefaults = "cardBinding_UserDefaults"
public let channelID_UserDefaults = "channelID_UserDefaults"

public let SD_UserDefaults_Password = "SD_UserDefaults_Password"
public let SD_UserDefaults_School = "SD_UserDefaults_School"


public let YKT_UserDefaults_PersonAccount = "YKT_UserDefaults_PersonAccount"
public let YKT_UserDefaults_Account = "YKT_UserDefaults_Account"
public let YKT_UserDefaults_Password = "YKT_UserDefaults_Password"

//启动图片
public let splashData_UserDefaults = "splashData_UserDefaults"


struct theme {
    //通用深蓝色
    static let DeepBlue = UIColor.init(red: 30/225, green: 35/225, blue: 245/225, alpha: 1)
    //通用浅蓝色
    static let BaseBlue = UIColor.init(red: 30/225, green: 145/225, blue: 225/225, alpha: 1)
    //ViewController的背景颜色
    static let WZLBackgroundColor: UIColor = UIColor.init(red:245/255, green: 245/255, blue: 245/255, alpha: 1)
    //APP导航条barButtonItem文字大小
    static let WZLNavItemFont: UIFont = UIFont.systemFontOfSize(16)
    //APP导航条titleFont文字大小
    static let WZLNavTitleFont: UIFont = UIFont.systemFontOfSize(18)

}
