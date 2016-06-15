//
//  customView.swift
//  CustomView(Swift)
//
//  Created by lk on 16/6/13.
//  Copyright © 2016年 LK. All rights reserved.
//

import UIKit
/// 自定义swift控件
@IBDesignable
class customView: UIView {

    @IBOutlet weak var sureBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBInspectable var title: String = ""{
        didSet{
            titleLabel.text = title
        }
    }
    
    //block
    var operationBlock: ((str:String) -> Void)?
    
    private lazy var view: UIView = {
        let view = NSBundle.mainBundle().loadNibNamed("customView", owner: self, options: nil)[0]as!UIView
        return view
    }()
    
    override init (frame:CGRect){
        super.init(frame: frame)
        self.view.backgroundColor = UIColor.redColor()
        setUpSubviews()
        
    }

    convenience init() {
        self.init(frame: UIScreen.mainScreen().bounds)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubviews()
        
    }
    
    func fromeNibView() ->UIView {
        let nib = NSBundle.mainBundle().loadNibNamed("customView", owner: self, options: nil)
        return nib[0]as!UIView

    }
    
    func setUpSubviews() {
        self.backgroundColor = UIColor.init(white: 0.0, alpha: 0.3)
        view.backgroundColor = UIColor.redColor()
        view.autoresizingMask = [UIViewAutoresizing.FlexibleHeight,UIViewAutoresizing.FlexibleWidth]
        view.center = self.center
        addSubview(view)
        
    }
    
    func removeCurrentView() {
       removeFromSuperview()
    }
    
    
    
    @IBAction func sureClick(sender: AnyObject) {
        removeCurrentView()
        if operationBlock != nil {
            operationBlock!(str: "0000000")
        }
    }
    
    @IBAction func cancelClick(sender: AnyObject) {
        removeCurrentView()

    }
}
