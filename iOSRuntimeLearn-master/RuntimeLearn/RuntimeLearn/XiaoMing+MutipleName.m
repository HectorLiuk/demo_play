//
//  XiaoMing+MutipleName.m
//  RuntimeLearn
//
//  Created by minggo on 16/1/20.
//  Copyright © 2016年 minggo. All rights reserved.
//

#import "XiaoMing+MutipleName.h"
#import <objc/runtime.h>
static NSString *cName = @"strKey";
@implementation XiaoMing (MutipleName)

//http://www.jianshu.com/p/3cbab68fb856


-(void)setChineseName:(NSString *) chineseName{
    objc_setAssociatedObject(self, &cName, chineseName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    enum {
        OBJC_ASSOCIATION_ASSIGN = 0, //关联对象的属性是弱引用
        
        OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1, //关联对象的属性是强引用并且关联对象不使用原子性
        
        OBJC_ASSOCIATION_COPY_NONATOMIC = 3, //关联对象的属性是copy并且关联对象不使用原子性
        
        OBJC_ASSOCIATION_RETAIN = 01401, //关联对象的属性是copy并且关联对象使用原子性
        
        OBJC_ASSOCIATION_COPY = 01403 //关联对象的属性是copy并且关联对象使用原子性
    };
}

-(NSString *)chineseName{
    return objc_getAssociatedObject(self, &cName);
}

@end
