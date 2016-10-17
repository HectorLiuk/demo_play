//
//  block.m
//  block写法
//
//  Created by lk on 16/4/5.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "block.h"

@implementation block

//-(NSString *)AFNetWork:(NSString *)name withComplatedRetunStr:(NSString *(^)(NSString * names,NSString * school))complated {
//    NSLog(@"----函数中打印带参数有返回值-%@",name);
//    if (complated) {
//    }
//    return complated(name,@"军事博物馆");
//;
//}

- (int)operationOne:(int)one two:(int)two returnCom:(int (^)(int one , int two))returnCom{
    return returnCom(one, two);
}

- (BOOL)parameterOne:(int)one two:(int)two returnCom:(BOOL (^)(int i ,int j))returnCom{
    return returnCom(one, two);
}

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


/*
How Do I Declare A Block in Objective-C?

As a local variable:

returnType (^blockName)(parameterTypes) = ^returnType(parameters) {...};
As a property:

@property (nonatomic, copy, nullability) returnType (^blockName)(parameterTypes);
As a method parameter:

- (void)someMethodThatTakesABlock:(returnType (^nullability)(parameterTypes))blockName;
As an argument to a method call:

[someObject someMethodThatTakesABlock:^returnType (parameters) {...}];
As a typedef:

typedef returnType (^TypeName)(parameterTypes);
TypeName blockName = ^returnType(parameters) {...};
*/


@end
