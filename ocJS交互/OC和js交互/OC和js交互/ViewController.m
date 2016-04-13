//
//  ViewController.m
//  OC和js交互
//
//  Created by lk on 16/4/12.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "jsOCModel.h"
@interface ViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *itemRight;
@property (nonatomic, strong) JSContext *jsContext;
@end

@implementation ViewController
//参考这篇blog写的练习
//通过 <JavaScriptCore/JavaScriptCore.h>   使用jsContext和jsValue
//https://github.com/CoderJackyHuang/IOSCallJsOrJsCallIOS


- (JSContext *)jsContext{
    if (!_jsContext) {
        _jsContext = [[JSContext alloc] init];
    }
    return _jsContext;
}
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"testActivity" withExtension:@"html"];
        NSURLRequest *requset = [NSURLRequest requestWithURL:url];
        _webView.scalesPageToFit = YES;
        _webView.delegate = self;
        [_webView loadRequest:requset];
        
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    
}
/**
 *  此jsContext方法只有在webView页面加载结束后才能调用
 *  意味着必须先获取js才能使用
 */
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    //模型注入
    jsOCModel *jsModel = [[jsOCModel alloc] init];
    self.jsContext[@"OCModel"] = jsModel;
    jsModel.webView = webView;
    jsModel.jsContext = self.jsContext;
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };
}
- (IBAction)pushBridge:(id)sender {
    Class class = NSClassFromString(@"JSBridgeViewController");
    UIViewController *viewVC = [[class alloc] init];
    [self.navigationController pushViewController:viewVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
