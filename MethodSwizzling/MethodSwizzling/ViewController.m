//
//  ViewController.m
//  MethodSwizzling
//
//  Created by Hector on 2016/12/20.
//  Copyright © 2016年 Hector. All rights reserved.
//

#import "ViewController.h"
//#import "AViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (IBAction)addClick:(id)sender {
//    AViewController *av = [[AViewController alloc] init];
//    [self.navigationController pushViewController:av animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
