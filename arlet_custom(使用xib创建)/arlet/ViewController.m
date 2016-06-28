//
//  ViewController.m
//  arlet
//
//  Created by lk on 16/6/15.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"
#import "AlertViewCustom.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)click:(id)sender {
    AlertViewCustom *alertView = [[AlertViewCustom alloc] init];
    alertView.titleLabel.text = @"sdshahahahsdsds";
    alertView.detail = @"sss";
    alertView.sureClickBlock = ^(){
        
    };
    
    [alertView showToView:self.view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
  

    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 200)];
    lable.numberOfLines = 0;
    lable.text = @"sdshahahaha \nsss";
    [self.view addSubview:lable];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
