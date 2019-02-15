//
//  LLFWKWebViewController.m
//  LLFAppDemo
//
//  Created by 帮啦跑腿 on 2019/2/14.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

#import "LLFWKWebViewController.h"
#import <WebKit/WebKit.h>

@interface LLFWKWebViewController ()<WKNavigationDelegate>

@property (nonatomic,strong) WKWebView *wkWebView;

@end

@implementation LLFWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self wkWebView];
}

-(WKWebView*)wkWebView{
    if (!_wkWebView) {
        _wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        [_wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]]];
        _wkWebView.navigationDelegate= self;
        _wkWebView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_wkWebView];
    }
    return _wkWebView;
}
#pragma WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    [EasyHelper showLoadingFade];
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [EasyHelper dismissLoadingFade];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    [EasyHelper showHUDWithMsg:@"页面加载失败！" duration:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
