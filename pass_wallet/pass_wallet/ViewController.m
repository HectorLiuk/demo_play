//
//  ViewController.m
//  pass_wallet
//
//  Created by lk on 16/4/11.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"
#import <PassKit/PassKit.h>

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
    //创建文件路径
    [self PathWithDirectoryName:@"pass"];
    
    
    
}
- (IBAction)pkpass:(id)sender {
    //------------------创建文件/文件夹
    //获取沙盒目录
    NSString *homePath = NSHomeDirectory();
    //在沙盒目录中创建一个文件file.text
    NSString *filePath = [homePath stringByAppendingPathComponent:@"Documents/file.text"];
    //NSFileManager是单利模式,所以不能使用alloc+init创建
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *str = @"无线互联";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    //参数：文件路径、文件内容、文件的属性
    BOOL sucess = [manager createFileAtPath:filePath contents:data attributes:nil];
    if(sucess){
        NSLog(@"文件创建成功");
    }else{
        NSLog(@"文件创建失败");
    }
    
    //创建文件夹
    NSString *filePaths = [homePath stringByAppendingPathComponent:@"Documents/file"];
    NSError *error;
    //需要传递一个创建失败的指针对象，记录创建失败的信息
    BOOL success1 = [manager createDirectoryAtPath:filePaths withIntermediateDirectories:YES attributes:nil error:&error];
    if(!success1){
        NSLog(@"创建成功");
    }else{
        NSLog(@"创建失败");
    }
    
    
    //--------------------读取文件
    //根据路径读取文件内容
    NSData *datas = [manager contentsAtPath:filePath];
    NSString *s = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",s);
    
    
    //--------------------移动文件/剪切文件
    //NSFileManager中没有提供重命名的方法，所以我们可以借助移动的api进行操作
    //把filePath移动到targetPath目录中
    NSString *targetPath = [homePath stringByAppendingPathComponent:@"Documents/file/file2.text"];
    BOOL sucess2 = [manager moveItemAtPath:filePath toPath:targetPath error:nil];
    if(sucess2) {
        NSLog(@"移动成功");
    }else{
        NSLog(@"移动失败");
    }
    
}

- (IBAction)addWallet:(id)sender {
     [self addPass];
}




- (NSString *)PathWithDirectoryName:(NSString *)directoryName
{
    NSString *docsdir = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *json = [NSString stringWithFormat:@"%@/test.json",docsdir];

    NSFileManager *filemanage = [NSFileManager defaultManager];
    
    if (directoryName == nil || directoryName.length == 0) {
        docsdir = [docsdir stringByAppendingPathComponent:@"pass"];
    } else {
        docsdir = [docsdir stringByAppendingPathComponent:directoryName];
    }
    BOOL isDir;
    BOOL exit =[filemanage fileExistsAtPath:docsdir isDirectory:&isDir];
    if (!exit || !isDir) {
        [filemanage createDirectoryAtPath:docsdir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    //创建pass.json文件
    
    NSString *dbpath = [docsdir stringByAppendingPathComponent:@"pass.json"];
    NSString *str = @"我是json数据";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [filemanage createFileAtPath:dbpath contents:data attributes:nil];
    
    
    //复制图片到dir中
    //调动复制方法必须 在设置toPath 文件详细地址
    NSString *photoPath=[[NSBundle mainBundle] pathForResource:@"111" ofType:@"png"];
    BOOL sucess =[filemanage copyItemAtPath:photoPath toPath:[NSString stringWithFormat:@"%@/111.png",docsdir] error:NULL];
    if (sucess) {
        NSLog(@"成功");
    }else{
        NSLog(@"失败");
    }
    
    
    return docsdir;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
