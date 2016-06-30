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
    
    
    var ssStr = ["ss","aaa"]

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
        let ImageView = customView()
            ImageView.detail = "sss"
            ImageView.detail = "sss"

        view.addSubview(ImageView)
        
//        TestViewController.someTypeMethod()
        
//        let 和 var  定义一个控件是没有区别的是吗？ 可以这样理解是吧
//        let只不过不能被相同类型的对象赋值
        let a = UIView()
        let b = UIView()
       // a = b  //这样是不行的
//        把a 改成 var 就可以了
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

