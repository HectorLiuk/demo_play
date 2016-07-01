//
//  ViewController.m
//  面试题练习
//
//  Created by lk on 16/7/1.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self blockOutsideVar];
    
    
}
//38题 在block内如何修改block外部变量
- (void)blockOutsideVar{
    NSMutableString *a = [NSMutableString stringWithString:@"Tom"]; NSLog(@"\n 定以前：------------------------------------ a指向的堆中地址：%p；a在栈中的指针地址：%p a值= %@", a, &a,a); //a在栈区
    void (^foo)(void) = ^{
        a.string = @"Jerry";
        NSLog(@"\n block内部：------------------------------------ a指向的堆中地址：%p；a在栈中的指针地址：%p a值= %@", a, &a,a); //a在栈区
//        a = [NSMutableString stringWithString:@"William"];
    };
    foo();
    NSLog(@"\n 定以后：------------------------------------ a指向的堆中地址：%p；a在栈中的指针地址：%p  a值= %@", a, &a,a);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
