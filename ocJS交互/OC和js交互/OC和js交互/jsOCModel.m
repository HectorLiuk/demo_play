//
//  jsOCModel.m
//  OC和js交互
//
//  Created by lk on 16/4/12.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "jsOCModel.h"

@implementation jsOCModel
- (void)callWithDict:(NSDictionary *)params {
    NSLog(@"Js调用了OC的方法，参数为：%@", params);
}

// Js调用了callSystemCamera
- (void)callSystemCamera{
    NSLog(@"JS调用了OC的方法，调起系统相册");
    
    // JS调用后OC后，又通过OC调用JS，但是这个是没有传参数的
    JSValue *jsFunc = self.jsContext[@"jsFunc"];
    [jsFunc callWithArguments:nil];
}

- (void)jsCallObjcAndObjcCallJsWithDict:(NSDictionary *)params {
    NSLog(@"jsCallObjcAndObjcCallJsWithDict was called, params is %@", params);
    
    // 调用JS的方法
    JSValue *jsParamFunc = self.jsContext[@"jsParamFunc"];
    [jsParamFunc callWithArguments:@[@{@"age": @10, @"name": @"lili", @"height": @158}]];
}

- (void)showAlert:(NSString *)title msg:(NSString *)msg{
    NSLog(@"调用oc的showAlert");
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [a show];
    });
}
- (void)copyInSystem:(NSString *)content
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = content;
    NSLog(@"调用复制粘贴方法%@",pasteboard.string);
}
@end
