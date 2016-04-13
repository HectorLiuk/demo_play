//
//  ViewController.m
//  pass_wallet
//
//  Created by lk on 16/4/11.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"
#import <PassKit/PassKit.h>
#import "FileChangeDir.h"
@interface ViewController ()<PKAddPassesViewControllerDelegate>
@property (strong,nonatomic) PKPass *pass;//票据
@property (strong,nonatomic) PKAddPassesViewController *addPassesController;//票据添加控制器
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (PKPass *)pass{
    if (!_pass) {
         NSString *passPath=[[NSBundle mainBundle] pathForResource:@"pass.pkpass" ofType:nil];
        NSData *passData=[NSData dataWithContentsOfFile:passPath];
        NSError *error=nil;
        _pass=[[PKPass alloc]initWithData:passData error:&error];
        if (error) {
            NSLog(@"创建Pass过程中发生错误，错误信息：%@",error.localizedDescription);
            return nil;
         }
    }
    return _pass;
}

- (PKAddPassesViewController *)addPassesController{
    if (!_addPassesController) {
        _addPassesController=[[PKAddPassesViewController alloc]initWithPass:self.pass];
         _addPassesController.delegate=self;//设置代理


    }
    return _addPassesController;
}


#pragma mark - 私有方法
-(void)addPass{
    if (![PKAddPassesViewController canAddPasses]) {
        NSLog(@"无法添加Pass.");
        return;
     }
    [self presentViewController:self.addPassesController animated:YES completion:nil];
}


#pragma mark - PKAddPassesViewController代理方法
-(void)addPassesViewControllerDidFinish:(PKAddPassesViewController *)controller{
     NSLog(@"添加成功.");
     [self.addPassesController dismissViewControllerAnimated:YES completion:nil];
     //添加成功后转到Passbook应用并展示添加的Pass
     NSLog(@"%@",self.pass.passURL);
     [[UIApplication sharedApplication] openURL:self.pass.passURL];
 }

- (IBAction)becomeDir:(id)sender {
    NSString *str = @"我是json数据";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *array = @[@"111",@"222"];
    
    FileChangeDir *file = [FileChangeDir fileDir];
    
    [file creatDirData:data images:array blockPath:^(NSString * path) {
        NSLog(@"parh:%@",path);
        //打包pkpass方法

    }];
    [file deleteDir];

    
}
- (IBAction)pkpass:(id)sender {
    
}

- (IBAction)addWallet:(id)sender {
     [self addPass];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
