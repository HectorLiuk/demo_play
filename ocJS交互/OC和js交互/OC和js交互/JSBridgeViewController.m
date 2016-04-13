//
//  JSBridgeViewController.m
//  OC和js交互
//
//  Created by lk on 16/4/12.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "JSBridgeViewController.h"
#import "WebViewJavascriptBridge.h"
@interface JSBridgeViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@property WebViewJavascriptBridge *bridge;
@end

@implementation JSBridgeViewController
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        _webView.delegate = self;
        _webView.scalesPageToFit = YES;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"testActivity" ofType:@"html"];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
        [_webView loadRequest:request];
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"JSBridge";
    [self.view addSubview:self.webView];
    
    _bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
    [_bridge registerHandler:@"birde" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"testObjcCallback called: %@", data);
        responseCallback(@"Response from testObjcCallback");
    }];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
