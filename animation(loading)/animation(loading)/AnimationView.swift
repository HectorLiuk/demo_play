//
//  AnimationView.swift
//  animation(loading)
//
//  Created by lk on 16/7/19.
//  Copyright © 2016年 LK. All rights reserved.
//

import UIKit

class AnimationView: UIView {

    let circleLayer = CircleLayer()
    
    let triangleLayer = TriangleLayer()
    
    let leftLineLayer = LeftLineLayer()
    
    let rightLineLayer = RightLineLayer()
    
    let leftLineLayerRed = LeftLineLayer()
    
    let rightLineLayerRed = RightLineLayer()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
        addCircleLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     1 圆形扩大动画
     */
    func addCircleLayer() {
        layer.addSublayer(circleLayer)
        circleLayer.expend()
       //延迟执行两种方法 
        //1 gcd
//        let time = dispatch_time(DISPATCH_TIME_NOW,Int64(0.3 * Double(NSEC_PER_SEC)))
//        dispatch_after(time, dispatch_get_main_queue()) {
            //防止循环引用
//            [unowned self]  in
//            self.circleLayer.wobblGroupAnimation()
//        }
        //2 NSTimer
        NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(wobbleCircleLayer), userInfo: nil, repeats: false)
    }
    
    /**
     2 圆形压缩动画
     */
    func wobbleCircleLayer() {
        circleLayer.wobblGroupAnimation()
        layer.addSublayer(triangleLayer)
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: #selector(triangleAnimationLayer), userInfo: nil, repeats: false)
    }
    
    /**
     三角形凸起
     */
    func triangleAnimationLayer() {
        triangleLayer.trangleGroupAnimation()
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: #selector(transformAnimation), userInfo: nil, repeats: false)

    }
    
    /**
     旋转视图 消失圆
     */
    func transformAnimation() {
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.65) //设置锚点 围绕此点旋转
        layer.addAnimation(triangleLayer.transformRotationZ(), forKey: nil)
        circleLayer.contract()
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: #selector(addLineLayer), userInfo: nil, repeats: false)
    }
    
    func addLineLayer() {
        layer.addSublayer(leftLineLayer)
        leftLineLayer.bottomToTopAnimation(UIColor.cyanColor(), fromValue: 0, toValue: 1, keyPath:"strokeEnd")
        layer.addSublayer(rightLineLayer)
        rightLineLayer.bottomToTopAnimation(UIColor.cyanColor(), fromValue: 0, toValue: 1, keyPath:"strokeEnd")
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(dismssLineLayer), userInfo: nil, repeats: false)
    }
    
    func dismssLineLayer() {
        
        layer.addSublayer(leftLineLayerRed)
        leftLineLayerRed.bottomToTopAnimation(UIColor.orangeColor(), fromValue: 1, toValue: 0,keyPath:"strokeStart")

        layer.addSublayer(rightLineLayerRed)
        rightLineLayerRed.bottomToTopAnimation(UIColor.orangeColor(), fromValue: 1, toValue: 0,keyPath:"strokeStart")
        


    }
    
}
