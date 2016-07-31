//
//  MainNavigationController.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/27.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer!.delegate = nil
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var backBtn: UIButton = {
        //设置返回按钮属性
        let backBtn = UIButton(type: UIButtonType.Custom)
        backBtn.titleLabel?.font = UIFont.systemFontOfSize(17)
        //        backBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        //        backBtn.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
        //        backBtn.setImage(UIImage(named: "back_1"), forState: .Normal)
        //        backBtn.setImage(UIImage(named: "back_2"), forState: .Highlighted)
        backBtn.setImage(UIImage(named: "标题栏_返回"), forState: .Normal)
        backBtn.setImage(UIImage(named: "标题栏_返回"), forState: .Highlighted)
        backBtn.addTarget(self, action: "backBtnClick", forControlEvents: .TouchUpInside)
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0)
        backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        backBtn.setTitle("aaaa", forState: .Normal)
        let btnW: CGFloat = AppWidth > 375.0 ? 30 : 28
        backBtn.frame = CGRectMake(5, 0, btnW, 40)
        return backBtn
    }()
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if self.childViewControllers.count > 0 {
            //            let vc = self.childViewControllers[0]
            //
            //            if self.childViewControllers.count == 1 {
            //                backBtn.setTitle(vc.navigationItem.title, forState: .Normal)
            //            } else {
            //                backBtn.setTitle("返回", forState: .Normal)
            //                backBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
            //            }
            //            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func backBtnClick() {
        self.popViewControllerAnimated(true)
    }
}
