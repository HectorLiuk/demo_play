//
//  ViewController.swift
//  事件的传递和响应机制
//
//  Created by lk on 16/7/14.
//  Copyright © 2016年 LK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    //http://www.jianshu.com/p/2e074db792ba
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let whiteView = WhiteView(frame:CGRectMake(100, 100, 300, 300))
//        whiteView.frame = CGRectMake(100, 100, 300, 300)
        whiteView.backgroundColor = UIColor.grayColor()
        view.addSubview(whiteView)
        
        
        let redView = RedView()
        redView.frame = CGRectMake(100, 100, 100, 100)
        redView.backgroundColor = UIColor.redColor()
        whiteView.addSubview(redView)
        
        let greenView = GreenView()
        greenView.frame = CGRectMake(100, 200, 100, 100)
        greenView.backgroundColor = UIColor.greenColor()
        whiteView.addSubview(greenView)
        
        
     
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("这是父控件")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

