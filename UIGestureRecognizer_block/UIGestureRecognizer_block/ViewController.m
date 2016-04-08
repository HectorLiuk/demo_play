//
//  ViewController.m
//  UIGestureRecognizer_block
//
//  Created by lk on 16/4/8.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"
#import "UIGestureRecognizer+Block.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *greenView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.greenView addGestureRecognizer:[UIGestureRecognizer nvm_gestureRecognizerWithActionBlock:^{
        NSLog(@"ssssss");
    }]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
