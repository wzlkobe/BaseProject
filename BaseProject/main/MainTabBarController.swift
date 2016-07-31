//
//  MainTabBarController.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/27.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(MainTabBar(), forKey: "tabBar")
        setUpAllChildViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /// 初始化所有子控制器
    private func setUpAllChildViewController() {
        // 首页
        tabBaraAddChildViewController(vc: firstPageViewController(), title: "首页", imageName: "导航栏_图标_首页_常态", selectedImageName: "导航栏_图标_首页_选中")
        // 资讯
        tabBaraAddChildViewController(vc: secondPageViewController(), title: "资讯", imageName: "导航栏_图标_资讯_常态", selectedImageName: "导航栏_图标_资讯_选中")
        // 服务
        tabBaraAddChildViewController(vc: thirdPageViewController(), title: "服务", imageName: "导航栏_图标_服务_常态", selectedImageName: "导航栏_图标_服务_选中")
        //校园卡
        tabBaraAddChildViewController(vc: fourthPageViewController(), title: "校园卡", imageName: "导航栏_图标_校园卡_常态", selectedImageName: "导航栏_图标_校园卡_选中")
        // 我的
        tabBaraAddChildViewController(vc: fifthPageViewController(), title: "我的", imageName: "导航栏_图标_我的_常态", selectedImageName: "导航栏_图标_我的_选中")
        
        
    }
    
    private func tabBaraAddChildViewController(vc vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        vc.view.backgroundColor = theme.WZLBackgroundColor
        
        //选中的字体颜色————蓝色
        //let BarItem = UITabBarItem.appearance()
        let selectedAttr = [
            NSForegroundColorAttributeName : theme.DeepBlue
        ]
        vc.tabBarItem.setTitleTextAttributes(selectedAttr, forState: .Selected)
        
        
        
        let nav = MainNavigationController(rootViewController: vc)
        addChildViewController(nav)
    }

}
class MainTabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translucent = false
        //self.backgroundImage = UIImage(named: "tabbar")
        //self.barTintColor = UIColor.blueColor()
        self.barStyle = UIBarStyle.Default
        
        //选中的tabbar背景色
        UITabBar.appearance().tintColor = UIColor.blueColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}
