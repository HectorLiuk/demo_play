//
//  ViewController.h
//  UIPanTest(侧滑菜单栏)
//
//  Created by lk on 16/4/18.
//  Copyright © 2016年 LK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UITableView *menuTableView;
@property (nonatomic, strong) UIView *contentDetailView;
@property (nonatomic, strong) NSArray *dataArray;
- (void)customViewWithClassName:(NSInteger)currentView;
@end

