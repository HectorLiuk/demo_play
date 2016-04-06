//
//  ViewController.m
//  block写法
//
//  Created by lk on 16/4/5.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"
#import "block.h"
@interface ViewController ()<blockDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    block *bView = [block new];
    
//回调 两种写法
    //get方法
    bView.voidBlock = ^(int i){
        NSLog(@"%d",i);
    };
    //set方法
    [bView setIntBlock:^(int i){
        return i;
    }];
    
//block写成方法
    
    [bView popBlock:^(int i) {
        
    }];
    
    [bView customBlock:^(int i) {
        
    }];
    
    [bView returnValue:^int(int i) {
        return i;
    }];
    
    
    
    bView.delegate = self;
    
    
    
}



@end
