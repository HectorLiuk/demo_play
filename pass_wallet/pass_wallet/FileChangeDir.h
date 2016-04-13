//
//  FileChangeDir.h
//  pass_wallet
//
//  Created by lk on 16/4/13.
//  Copyright © 2016年 LK. All rights reserved.
//
// 此类功能:
// 为打包pkpass文件做准备
// 创建一个文件夹：1.创建pass.json
//               2.从工程目录复制图片到文件目录下(@2x)
#import <Foundation/Foundation.h>

@interface FileChangeDir : NSObject
+ (instancetype)fileDir;
- (void)creatDirData:(NSData *)data images:(NSArray *)images blockPath:(void (^)(NSString * path))blockcall;
- (void)deleteDir;
@end
