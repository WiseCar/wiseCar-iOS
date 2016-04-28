//
//  GFDelegateViewController.m
//  WiseCar
//
//  Created by 陈光法 on 16/4/28.
//  Copyright © 2016年 mll. All rights reserved.
//

#import "GFDelegateViewController.h"
#import "GFNavigationView.h"

@interface GFDelegateViewController () {
    
    CGFloat kWidth;
    CGFloat kHeight;
}

@end

@implementation GFDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 基础设置
    [self _setBase];
    
    // 界面布局
    [self _setView];
}

- (void)_setBase {
    
    kWidth = [UIScreen mainScreen].bounds.size.width;
    kHeight = [UIScreen mainScreen].bounds.size.height;
    
    // 导航栏
    GFNavigationView *navView = [[GFNavigationView alloc] initWithLeftImgName:@"1" withLeftImgHightName:@"4" withRightImgName:nil withRightImgHightName:nil withCenterTitle:@"智车服务协议" withFrame:CGRectMake(0, 0, kWidth, 64)];
    
    [self.view addSubview:navView];
    [navView.leftBut addTarget:self action:@selector(leftButClick) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)_setView {

    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64)];
    NSString* path = [[NSBundle mainBundle] pathForResource:_delegateTitle ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    
    
}






- (void)leftButClick {
    
    [self.navigationController popViewControllerAnimated:NO];
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
