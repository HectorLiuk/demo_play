//
//  jsOCModel.h
//  OC和js交互
//
//  Created by lk on 16/4/12.
//  Copyright © 2016年 LK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JavaScriptOCInteractionDelegate <JSExport>
// JS调用此方法来调用OC的系统相册方法
- (void)callSystemCamera;
#warning 特别注意点
// 在JS中调用时，函数名应该为showAlertMsg(arg1, arg2) //多个参数直接在后面添加姓名
// 这里是只两个参数的。
- (void)showAlert:(NSString *)title msg:(NSString *)msg;
// 通过JSON传过来
- (void)callWithDict:(NSDictionary *)params;
// JS调用Oc，然后在OC中通过调用JS方法来传值给JS。
- (void)jsCallObjcAndObjcCallJsWithDict:(NSDictionary *)params;
//复制到粘贴版
- (void)copyInSystem:(NSString *)content;



@end


// 此模型用于注入JS的模型，这样就可以通过模型来调用方法。
@interface jsOCModel : NSObject<JavaScriptOCInteractionDelegate>
@property (nonatomic, strong) JSContext *jsContext;
@property (nonatomic, strong) UIWebView *webView;
@end
