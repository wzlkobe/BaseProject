//
//  firstPageViewController.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/27.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
import SnapKit

class firstPageViewController: UIViewController {

    var LocationBtn:UIButton!
    var LocationBtn2:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "第一页"
        self.view.backgroundColor = theme.WZLBackgroundColor
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        let data = Alamofire.request(.GET, "http://www.baidu.com/")
        print(data)
        
        addLocation()
        addPresent()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addLocation(){
        LocationBtn = UIButton(frame: CGRectMake(80,50,AppWidth-160,50))
        LocationBtn.backgroundColor = theme
            .BaseBlue
        LocationBtn.setTitle("定位页面", forState: UIControlState.Normal)
        LocationBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        LocationBtn.addTarget(self, action: "LocationGo", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(LocationBtn)
    }
    func addPresent(){
        LocationBtn2 = UIButton(frame: CGRectMake(80,150,AppWidth-160,50))
        LocationBtn2.backgroundColor = theme
            .BaseBlue
        LocationBtn2.setTitle("Present", forState: UIControlState.Normal)
        LocationBtn2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        LocationBtn2.addTarget(self, action: "presentGo", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(LocationBtn2)
    }
    func LocationGo(){
        let location = LocationTool()
        self.navigationController?.showViewController(location, sender: nil)
    }
    func h(){
        print("ddd")
    }
    func presentGo(){
        
        let shopCar = turn1()
        let nav = MainNavigationController(rootViewController: shopCar)
        self.navigationController?.presentViewController(nav, animated: true, completion: nil)
        
//        weak var tmpSelf = self
//        yellowShopCar = YellowShopCarView(frame: CGRectMake(ScreenWidth - 70, 50 - 61 - 10, 61, 61), shopViewClick: { () -> () in
//            let shopCarVC = ShopCartViewController()
//            let nav = BaseNavigationController(rootViewController: shopCarVC)
//            tmpSelf!.presentViewController(nav, animated: true, completion: nil)
//        })
        
        
//        let location = turn1()
//        self.navigationController?.presentViewController(location, animated: true, completion: nil)
    }

}
