//
//  ViewController.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/26.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request(.GET, "http://www.baidu.com/")
        let s = UIView(frame: CGRectMake(0,0,50,50))
        let ss = s.frame.origin.x
        print(ss)
        SVProgressHUD.showWithStatus("正在清理缓存")
        SVProgressHUD.dismiss()
        let jsonString = " dd"
        if let dataFromString = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

