//
//  MeViewController.m
//  UIPanTest(侧滑菜单栏)
//
//  Created by pht on 16/4/18.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "MeViewController.h"
#import "TestViewController.h"
#import "TwoViewController.h"
#import "OneViewController.h"
@interface MeViewController ()
//@property ()
@end

@implementation MeViewController
//- (TestViewController *)redVC{
//    if (!_redVC) {
//        _redVC = [[TestViewController alloc] init];
//        _redVC.color = [UIColor redColor];
//        [self addChildViewController:_redVC];
//        
//    }
//    return _redVC;
//}
//- (OneViewController *)blackVC{
//    if (!_blackVC) {
//        _blackVC = [[OneViewController alloc] init];
//        [self addChildViewController:_blackVC];
//        
//    }
//    return _blackVC;
//}
//
//- (TwoViewController *)twoVC{
//    if (!_twoVC) {
//        _twoVC = [[TwoViewController alloc] init];
//        [self addChildViewController:self.twoVC];
//        
//    }
//    return _twoVC;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = @[@"TestViewController",@"OneViewController",@"TwoViewController"];
    self.btnImages = @[@"111",@"111",@"111"];
    
    
    
}


//- (void)customViewWithClassName:(NSInteger)currentView{
//    //选中页面
//        switch (currentView) {
//            case 0:
//                [self.contentDetailView addSubview:self.redVC.view];
//                break;
//            case 1:
//                [self.contentDetailView addSubview:self.blackVC.view];
//                break;
//            case 2:{
//                Class viewControllerClass = NSClassFromString(@"TestViewController");
//
//                UIViewController *vc = [[viewControllerClass alloc] init];
//
//                [self.contentDetailView addSubview:vc.view];
//                [self addChildViewController:vc];
//
//
//
//
//
//
//            }break;
//            case 3:{
//                [self.contentDetailView addSubview:self.twoVC.view];
//
//
//            }break;
//            default:
//                break;
//        }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
