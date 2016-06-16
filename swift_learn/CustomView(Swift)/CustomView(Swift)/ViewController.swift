//
//  ViewController.swift
//  CustomView(Swift)
//
//  Created by lk on 16/6/13.
//  Copyright © 2016年 LK. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var array = []
    
    
    
    //懒加载创建控件
    private lazy var backImageView: customView = {
        let backImageView = customView()
        return backImageView
    }()
    let i:Int = 0
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backImageView)
        UIView.animateWithDuration(10) { () -> Void in
            
        }
        backImageView.operationBlock = {(str) -> Void in
            let oo = Int()
            print(String(oo)+"11111"+str)
            print(self,self.view,oo)
            
        }

//        //使用正常创建控件
//        let ImageView = customView.init(frame: CGRectMake(10, 300, 300, 200))
//        
//        view.addSubview(ImageView)
        
        
        
//        TestViewController.someTypeMethod()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

