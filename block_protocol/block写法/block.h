//
//  block.h
//  block写法
//
//  Created by lk on 16/4/5.
//  Copyright © 2016年 LK. All rights reserved.
//

#import <UIKit/UIKit.h>
//无返回值block
typedef void (^voidBlock)(int i);
//int返回值block
typedef int (^intBlock)(int i);
//无参数block
typedef void (^parameterBlock)();


@protocol blockDelegate;

@interface block : UIView
@property (nonatomic, copy) void(^ sendMsgBlock)();

@property (nonatomic, copy) voidBlock voidBlock;
@property (nonatomic, copy) intBlock intBlock;
@property (nonatomic, copy) parameterBlock parameterBlock;
//系统block写法
- (void)popBlock:(void (^)(int i))block;
//自定义block
- (void)customBlock:(voidBlock)block;
// 有返回值的
- (void)returnValue:(intBlock)block;

//协议
@property (nonatomic, weak) id<blockDelegate> delegate;

@end

@protocol blockDelegate <NSObject>
@required//可选择
- (void)delegateValue:(block *)block;
@end
