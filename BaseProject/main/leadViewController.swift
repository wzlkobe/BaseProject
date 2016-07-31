//
//  leadViewController.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/27.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit

class leadViewController: UIViewController ,UIScrollViewDelegate{
    var scrollView = UIScrollView()
    var pageControll = UIPageControl()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControll.center = CGPointMake(self.view.frame.width/2, self.view.frame.height-30)
        pageControll.currentPageIndicatorTintColor = UIColor.redColor()
        pageControll.pageIndicatorTintColor = UIColor.whiteColor()
        pageControll.numberOfPages = 4
        pageControll.addTarget(self, action: "scrollViewDidEndDecelerating", forControlEvents: UIControlEvents.ValueChanged)
        
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSizeMake(4*self.view.frame.width, 0)
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for(var i=0;i<4;i++)
        {
            let image = UIImage(named: "welcome0\(i+1)")
            let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            imageView.image = image
            var frame = imageView.frame
            frame.origin.x = CGFloat(i)*frame.size.width
            imageView.frame = frame
            scrollView.addSubview(imageView)
            self.view.addSubview(pageControll)
        }
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/self.view.frame.size.width)
        pageControll.currentPage = index
        if index==3 {
            self.button.frame = CGRectMake(3*self.view.frame.width, self.view.frame.height, self.view.frame.width, 50)
            self.button.setTitle("开启云卡之旅", forState: UIControlState.Normal)
            self.button.titleLabel?.font = UIFont.systemFontOfSize(20)
            self.button.setTitleColor(UIColor.whiteColor(),forState: UIControlState.Normal)
            self.button.backgroundColor = UIColor.orangeColor()
            self.button.alpha = 0
            self.button.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
            UIView.animateWithDuration(0.5, delay: 0.3, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.button.frame = CGRectMake(3*self.view.frame.width, self.view.frame.height-100, self.view.frame.width, 50)
                self.button.alpha = 1
                self.scrollView.addSubview(self.button)
                }, completion: nil)
        }
    }
    func btnClick(button:UIButton){
        
        self.presentViewController(MainTabBarController(), animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
