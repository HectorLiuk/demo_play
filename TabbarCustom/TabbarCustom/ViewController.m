//
//  ViewController.m
//  TabbarCustom
//
//  Created by lk on 16/4/24.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"
#import "PDTabbarViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIViewController *view4 = [[UIViewController alloc] init];
    view4.view.backgroundColor = [UIColor redColor];
    
    [(PDTabbarViewController *)self.tabBarController setMTabBarHidden:YES];
    
    view4.hidesBottomBarWhenPushed= YES;
    
    [self.navigationController pushViewController:view4 animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
