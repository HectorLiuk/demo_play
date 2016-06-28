//
//  AlertViewCustomSwift.swift
//  arlet
//
//  Created by lk on 16/6/16.
//  Copyright © 2016年 LK. All rights reserved.
//

import UIKit

class AlertViewCustomSwift: UIView {
    
    private lazy var alertView: UIView = {
        let alertView = NSBundle.mainBundle().loadNibNamed("AlertViewCustom", owner: self, options: nil)[0]as!UIView
        alertView.layer.cornerRadius = 5.0
        alertView.layer.masksToBounds = true
        alertView.center = self.center;
        return alertView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.mainScreen().bounds)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpSubviews() {
        backgroundColor = UIColor.init(white: 0.0, alpha: 0.5)
//        self.titleLabel.numberOfLines = 0;
//        self.alertView.height -= 15;
//        self.titleLabel.y += 5;
//        [self addSubview:self.alertView];
    }
   

}
