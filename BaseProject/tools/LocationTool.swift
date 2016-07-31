//
//  LocationTool.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/29.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit
import CoreLocation
import SVProgressHUD

class LocationTool: UIViewController ,CLLocationManagerDelegate ,UISearchBarDelegate{


    var from:Int!
    private var locationManager:CLLocationManager!
    private var alert:UIAlertView!
    private var scrollerView:UIScrollView!
    private var scrollerView2:UIScrollView!
    private var search:UISearchBar!
    private var tap:UITapGestureRecognizer!
    private var tableView = UITableView(frame: CGRectMake(0, 0, AppWidth, AppHeight-NavigationH), style: UITableViewStyle.Grouped)
    var button = UIButton(frame: CGRectMake(50, AppHeight, AppWidth-100, 30))
    var timer:NSTimer?
    override func viewDidLoad() {
        self.title = "定位功能"
        self.view.backgroundColor = theme.WZLBackgroundColor
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillshow", name: UIKeyboardWillShowNotification, object: nil)
        setBackground()
    }
    func setBackground(){
        scrollerView2 = UIScrollView(frame: CGRectMake(0,60,AppWidth,AppHeight))
        scrollerView2.backgroundColor = UIColor.blackColor()
        scrollerView2.alpha = 0.3
        
        scrollerView = UIScrollView(frame: CGRectMake(0,0,AppWidth,AppHeight))
        scrollerView.backgroundColor = theme.WZLBackgroundColor
        tap = UITapGestureRecognizer(target: self, action: "scrollerViewClick")
        
        search = UISearchBar(frame: CGRectMake(0,10,AppWidth,40))
        search.placeholder = "请输入你的学校"
        //search.showsSearchResultsButton = true
        search.delegate = self
        let searchView = UIView(frame: CGRectMake(0,0,AppWidth,60))
        searchView.backgroundColor = theme.WZLBackgroundColor
        searchView.addSubview(search)
        scrollerView.addSubview(searchView)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.bounces = false
        tableView.tableHeaderView = searchView
        scrollerView.addSubview(tableView)
        
        //        tableView.addGestureRecognizer(tap1)
        
        scrollerView2.addGestureRecognizer(tap)
        self.view.addSubview(scrollerView)
        self.view.addSubview(scrollerView2)
        scrollerView2.hidden = true
        
    }

    //定位功能
    func location(){
        
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1000
        locationManager.delegate = self
        
        locationManager.startUpdatingLocation()
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        
        let lati = "\(newLocation.coordinate.latitude)"
        let longi = "\(newLocation.coordinate.longitude)"
        locationManager.stopUpdatingLocation()
        alert = UIAlertView(title: "提示", message: "经度："+lati+"，纬度："+longi, delegate: self, cancelButtonTitle: "确定")
        alert.show()
        //setBackground()
        
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    func getSchool(latitude: String, longitude: String) -> Bool{
        let tmpSelf = self
        //let url = NSURL(string: YKTUrl+"customer/nearbySchool?rqsJson=%7B%22x%22:"+latitude+",%22y%22:"+longitude+"%7D"+YKTSign)
        let url = NSURL(string: YKTUrl+"customer/nearbySchool?rqsJson=%7B%22x%22:0,%22y%22:0%7D"+YKTSign)
        let data = NSData(contentsOfURL: url!)
        if data != nil {
            let dict:NSDictionary!
            do{
                dict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
//                let modelTool = DictModelManager.sharedManager
//                let datas = modelTool.objectWithDictionary(dict, cls: LocationSchool.self) as? LocationSchool
//                tmpSelf.schoolList = datas
//                tmpSelf.tableView.reloadData()
                return true
            }catch{
                return false
            }
        }else{
            return false
        }
    }
}

//其他功能
extension LocationTool: UITableViewDataSource,UITableViewDelegate{
    //点击背景，收回键盘
    func scrollerViewClick() {
        search.endEditing(true)
        scrollerView2.hidden = true
    }
    //键盘显示时，同时显示黑幕，留下搜索框，黑幕点击可将键盘回收
    func keyBoardWillshow(){
        scrollerView2.hidden = false
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        search.endEditing(true)
        scrollerView2.hidden = true
        
        SVProgressHUD.showWithStatus("正在搜索您的学校...")
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Black)
        let name:String = (searchBar.text!).stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLUserAllowedCharacterSet())!
        
        
        alert = UIAlertView(title: "提示", message: name, delegate: self, cancelButtonTitle: "确定")
        alert.show()
        SVProgressHUD.dismiss()
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var tableViewCell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cellIdd")
        if tableViewCell==nil {
            tableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellIdd")
            tableViewCell?.selectionStyle = UITableViewCellSelectionStyle.Gray
            tableViewCell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            
            if indexPath.section == 0{
                tableViewCell?.textLabel?.text = "请定位你的学校"
                tableViewCell?.imageView?.image = UIImage(named: "登录_定位")
                tableViewCell?.textLabel?.font = UIFont.systemFontOfSize(15)
                tableViewCell?.textLabel?.textColor = UIColor.blueColor()
            }else{
                print(2222222)
                tableViewCell?.textLabel?.text = "请定位"
            }
        }
        
        return tableViewCell!
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 1
        }else{
            return 5
        }
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 1
        }else{
            return 5
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //使返回时取消选中状态
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        if indexPath.section == 0{
            location()
        }else{
            if from == 1{
                
            }else if from == 2{
                
            }else if from == 3{
                
            }else if from == 4{
               
                
            }
            
            
            
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return 0
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
}
