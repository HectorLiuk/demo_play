//
//  RedView.swift
//  事件的传递和响应机制
//
//  Created by lk on 16/7/14.
//  Copyright © 2016年 LK. All rights reserved.
//

import UIKit

class RedView: UIView {

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("这是redView")
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = (touches as NSSet).anyObject()
        
        let currentPoint = touch?.locationInView(self)
        print(currentPoint)
        
        let previousPoint = touch?.previousLocationInView(self)
        
        let offSetX = (currentPoint?.x)! - (previousPoint?.x)!
        
        let offSetY = (currentPoint?.y)! - (previousPoint?.y)!
        
        transform = CGAffineTransformScale(transform, offSetX, offSetY)
    }
    
    //撞击触发事件
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        return self
    }


}



