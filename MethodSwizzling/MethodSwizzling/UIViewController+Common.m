//
//  UIViewController+Common.m
//  MethodSwizzling
//
//  Created by Hector on 2016/12/20.
//  Copyright © 2016年 Hector. All rights reserved.
//

#import "UIViewController+Common.h"
#import <objc/runtime.h>

@implementation UIViewController (Common)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(mrc_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            //如果返回成功:则说明被替换方法没有存在.也就是被替换的方法没有被实现,我们需要先把这个方法实现,然后再执行我们想要的效果,用我们自定义的方法去替换被替换的方法. 这里使用到的是'class_replaceMethod'这个方法. class_replaceMethod本身会尝试调用class_addMethod和method_setImplementation，所以直接调用class_replaceMethod就可以了)
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            //如果返回失败:则说明被替换方法已经存在.直接将两个方法的实现交换
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

- (void)mrc_viewWillAppear:(BOOL)animated {
    [self mrc_viewWillAppear:animated]; //这是已经交换过IMP指针的方法 实际是执行[self viewWillAppear:animated]; 实现系统的方法后 在打印当前类
    NSLog(@"!!!_%@",NSStringFromClass([self class]));
}
@end
