//
//  GFForgetPasswordViewController.m
//  WiseCar
//
//  Created by 陈光法 on 16/4/27.
//  Copyright © 2016年 mll. All rights reserved.
//

#import "GFForgetPasswordViewController.h"
#import "GFNavigationView.h"

@interface GFForgetPasswordViewController () {
    
    CGFloat kWidth;
    CGFloat kHeight;
}

@end

@implementation GFForgetPasswordViewController

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
    GFNavigationView *navView = [[GFNavigationView alloc] initWithLeftImgName:nil withLeftImgHightName:nil withRightImgName:nil withRightImgHightName:nil withCenterTitle:nil withFrame:CGRectMake(0, 0, kWidth, 64)];
    [self.view addSubview:navView];
    
    
}


- (void)_setView {
    
    
    
    
    
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
