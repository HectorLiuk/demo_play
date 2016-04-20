//
//  LKMenuPanViewController.h
//  UIPanTest(侧滑菜单栏)
//
//  Created by pht on 16/4/18.
//  Copyright © 2016年 LK. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  此类侧滑菜单栏
 */
@interface LKMenuPanViewController : UIViewController
@property (nonatomic, strong) UITableView *menuTableView;
@property (nonatomic, strong) UIView *contentDetailView;
@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) NSArray *btnImages;
@property (nonatomic, strong) NSArray *titles;
/**
 *  重写此方法
 */
- (void)customViewWithClassName:(NSInteger)currentView;
@end
