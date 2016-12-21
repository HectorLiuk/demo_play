//
//  ViewController.m
//  block写法
//
//  Created by lk on 16/4/5.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"
#import "block.h"
#import "blockTheory.h"
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
    
    
   int i = [bView operationOne:1 two:10 returnCom:^int(int a, int b) {
       NSLog(@"a=%d,b=%d",a,b);
       return a + b;
   }];
    
    NSLog(@"%d",i);
    
    BOOL bo = [bView parameterOne:30 two:20 returnCom:^BOOL(int i, int j) {
        return i > j ? YES : NO;
    }];
    NSLog(@"Bool = %d",bo);
    
    NSLog(@"```````````````````````");
    blockTheory *block = [[blockTheory alloc] init];
    [block blockTheory];
    
}

- (void)delegateValue:(block *)block{
    
}

@end
