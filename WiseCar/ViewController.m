//
//  ViewController.m
//  WiseCar
//
//  Created by 李孟龙 on 16/4/26.
//  Copyright © 2016年 mll. All rights reserved.
//

#import "ViewController.h"

#import "GFTipView.h"
#import "GFTextFieldView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor cyanColor];
//    GFTipView *tip1 = [GFTipView tipViewWithJinduTiaoTipName:@"进度条"];
//    [self.view addSubview:tip1];
//    [tip1 tipViewRemove2];
    
    
//    GFTipView *tip2 = [[GFTipView alloc] initWithNormalHeightWithMessage:@"请求成功" withViewController:self withShowTimw:5];
//    [tip2 tipViewShow];

//    GFTipView *tip3 = [[GFTipView alloc] initWithHeight:500 WithMessage:@"请求失败" withViewController:self withShowTimw:5];
//    [tip3 tipViewShow];
//
//    CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
////    CGFloat kHeight = [UIScreen mainScreen].bounds.size.height;
//    GFTextFieldView *txtview = [[GFTextFieldView alloc] initWithFrame:CGRectMake(0, 50, kWidth, 50) withLeftImgName:@"1"];
//    [self.view addSubview:txtview];
//    txtview.textField.placeholder = @"sdfhaskdhgkas";
//    
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(0, 0, 100, 200);
//    btn.backgroundColor = [UIColor greenColor];
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    GFTextFieldView *txtvv = [[GFTextFieldView alloc] initWithFrame:CGRectMake(0, 150, kWidth, 50) withLeftImgName:@"1" withRightButton:btn withBtnImgName:@"2"];
//    [self.view addSubview:txtvv];
//    
}

- (void)btnClick {

    NSLog(@"我是按钮");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
