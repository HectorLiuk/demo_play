//
//  block.m
//  block写法
//
//  Created by lk on 16/4/5.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "block.h"

@implementation block




//系统block写法
- (void)popBlock:(void (^)(int i))block{
    block(5);
}
//自定义block
- (void)customBlock:(voidBlock)block{
    
}
// 有返回值的
- (void)returnValue:(intBlock)block{
    block(5);
}



- (void)add{
    if ([self.delegate respondsToSelector:@selector(delegateValue:)]) {
        [self.delegate delegateValue:self];
    }
}



@end
