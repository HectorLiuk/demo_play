//
//  ViewController.swift
//  事件的传递和响应机制
//
//  Created by lk on 16/7/14.
//  Copyright © 2016年 LK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let redView = RedView()
        redView.frame = CGRectMake(100, 100, 100, 100)
        redView.backgroundColor = UIColor.redColor()
        view.addSubview(redView)
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

