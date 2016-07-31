//
//  turn1.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/29.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit

class turn1: UIViewController {
    var LocationBtn2:UIButton!
    override func viewDidLoad() {
        self.title = "turn1"
        self.view.backgroundColor = theme.WZLBackgroundColor
        addPresent()
        
    }
    func addPresent(){
        LocationBtn2 = UIButton(frame: CGRectMake(80,50,AppWidth-160,50))
        LocationBtn2.backgroundColor = theme
            .BaseBlue
        LocationBtn2.setTitle("Present", forState: UIControlState.Normal)
        LocationBtn2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        LocationBtn2.addTarget(self, action: "presentGo", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(LocationBtn2)
    }
    func presentGo(){
        
        
        
        let location = turn2ViewController()
        self.navigationController?.showViewController(location, sender: nil)
    }
    
}
