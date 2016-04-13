//
//  FileChangeDir.m
//  pass_wallet
//
//  Created by lk on 16/4/13.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "FileChangeDir.h"

@interface FileChangeDir()
@property (nonatomic, strong) NSFileManager *filemanage;
@property (nonatomic, copy, readwrite) NSString *docsdir;
@end



@implementation FileChangeDir
- (NSFileManager *)filemanage{
    if (!_filemanage) {
        _filemanage = [NSFileManager defaultManager];
    }
    return _filemanage;
}

- (NSString *)docsdir{
    if (!_docsdir) {
        _docsdir = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    }
    return _docsdir;
}

+ (instancetype)fileDir{
    return [[FileChangeDir alloc] init];
}
- (void)creatDirData:(NSData *)data images:(NSArray *)images blockPath:(void (^)(NSString * path))blockcall{
    //创建文件夹
    [self pathWithDirectoryName:nil];
    //复制图片
    for (NSString *imageName in images) {
        [self copyImageToPass:imageName];
    }
    //注入pass.json
    [self creatPassJsonData:data];
    //回调文件地址
    blockcall(self.docsdir);
}


//创建文件夹
- (void)pathWithDirectoryName:(NSString *)directoryName{

    if (directoryName == nil || directoryName.length == 0) {
        self.docsdir = [self.docsdir stringByAppendingPathComponent:@"pass"];
    } else {
        self.docsdir = [self.docsdir stringByAppendingPathComponent:directoryName];
    }
    BOOL isDir;
    BOOL exit =[self.filemanage fileExistsAtPath:self.docsdir isDirectory:&isDir];
    if (!exit || !isDir) {
        [self.filemanage createDirectoryAtPath:self.docsdir withIntermediateDirectories:YES attributes:nil error:nil];
    }
}
//创建pass.json文件
- (void)creatPassJsonData:(NSData *)data{
    NSString *dbpath = [self.docsdir stringByAppendingPathComponent:@"pass.json"];
    [self.filemanage createFileAtPath:dbpath contents:data attributes:nil];
}
//复制图片到文件夹下
- (void)copyImageToPass:(NSString *)imageNamePng{
    //调用复制方法必须 在设置toPath 文件详细地址
//    NSString *photoPath=[[NSBundle mainBundle] pathForResource:@"Assets.xcassets" ofType:NULL];
//    photoPath = [photoPath stringByAppendingString:@"monkey"];
     NSString *photoPath=[[NSBundle mainBundle] pathForResource:imageNamePng ofType:@"png"];
   [self.filemanage copyItemAtPath:photoPath toPath:[NSString stringWithFormat:@"%@/%@.png",self.docsdir,imageNamePng] error:NULL];
}
- (void)deleteDir{
    [self.filemanage removeItemAtPath:self.docsdir error:NULL];
}
@end
