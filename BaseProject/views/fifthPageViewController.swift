//
//  fifthPageViewController.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/27.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit
import SVProgressHUD

class fifthPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "第五页"
        self.view.backgroundColor = theme.WZLBackgroundColor
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        //SVProgressHUD.showWithStatus("正在清理缓存")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
