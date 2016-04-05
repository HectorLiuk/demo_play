//
//  block.m
//  block写法
//
//  Created by lk on 16/4/5.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "block.h"

@implementation block

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [[self alloc] init];
}


//系统block写法
- (void)popBlock:(void (^)(int i))block{
    
}
//自定义block
- (void)customBlock:(voidBlock)block{
    
}
@end
