//
//  GFSignUpViewController.m
//  WiseCar
//
//  Created by 陈光法 on 16/4/27.
//  Copyright © 2016年 mll. All rights reserved.
//

#import "GFSignUpViewController.h"
#import "GFNavigationView.h"
#import "GFTextFieldView.h"
#import "GFSignInViewController.h"
#import "GFDelegateViewController.h"

@interface GFSignUpViewController () {
    
    CGFloat kWidth;
    CGFloat kHeight;
    
    CGFloat hangjv;
    CGFloat jianjv;
}

@property (nonatomic, strong) GFTextFieldView *IDtxt;
@property (nonatomic, strong) GFTextFieldView *carIDTxt;
@property (nonatomic, strong) GFTextFieldView *carBrandTxt;
@property (nonatomic, strong) GFTextFieldView *carSSTxt;
@property (nonatomic, strong) GFTextFieldView *ODOTxt;
@property (nonatomic, strong) GFTextFieldView *enginTxt;
@property (nonatomic, strong) GFTextFieldView *OCTxt;
@property (nonatomic, strong) GFTextFieldView *ageTxt;




@end

@implementation GFSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 基础设置
    [self _setBase];
    
    // 界面布局
    [self _setView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)_setBase {
    
    kWidth = [UIScreen mainScreen].bounds.size.width;
    kHeight = [UIScreen mainScreen].bounds.size.height;
    hangjv = kHeight * 0.011;
    jianjv = kWidth * 0.037;
    
    // 导航栏
    GFNavigationView *navView = [[GFNavigationView alloc] initWithLeftImgName:@"1" withLeftImgHightName:@"2" withRightImgName:nil withRightImgHightName:nil withCenterTitle:@"车辆信息" withFrame:CGRectMake(0, 0, kWidth, 64)];
    navView.backgroundColor = [UIColor colorWithRed:55 / 255.0 green:90 / 255.0 blue:146 / 255.0 alpha:1];
    [self.view addSubview:navView];
    [navView.leftBut addTarget:self action:@selector(leftButClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor = [UIColor colorWithRed:228 / 255.0 green:229 / 255.0 blue:230 / 255.0 alpha:1];
    
}


- (void)_setView {
    
    // 车云ID
    CGFloat IDtxtW = kWidth;
    CGFloat IDtxtH = kHeight * 0.078;
    CGFloat IDtxtX = 0;
    CGFloat IDtxtY = 64 + hangjv;
    self.IDtxt = [[GFTextFieldView alloc] initWithFrame:CGRectMake(IDtxtX, IDtxtY, IDtxtW, IDtxtH) withLeftName:@"车云ID"];
    [self.IDtxt.textField setValue:[UIFont systemFontOfSize:(14 / 320.0 * kWidth)] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:self.IDtxt];
    
    // 车牌号
    CGFloat carIDTxtW = kWidth;
    CGFloat carIDTxtH = kHeight * 0.078;
    CGFloat carIDTxtX = 0;
    CGFloat carIDTxtY = CGRectGetMaxY(self.IDtxt.frame) + hangjv;
    self.carIDTxt = [[GFTextFieldView alloc] initWithFrame:CGRectMake(carIDTxtX, carIDTxtY, carIDTxtW, carIDTxtH) withLeftName:@"车牌号"];
    [self.view addSubview:self.carIDTxt];
    
    // 车品牌
    CGFloat carBrandTxtW = kWidth;
    CGFloat carBrandTxtH = kHeight * 0.078;
    CGFloat carBrandTxtX = 0;
    CGFloat carBrandTxtY = CGRectGetMaxY(self.carIDTxt.frame) + hangjv;
    self.carBrandTxt = [[GFTextFieldView alloc] initWithFrame:CGRectMake(carBrandTxtX, carBrandTxtY, carBrandTxtW, carBrandTxtH) withLeftName:@"车品牌"];
    [self.view addSubview:self.carBrandTxt];
    
    
    // 车系
    CGFloat carSSTxtW = kWidth;
    CGFloat carSSTxtH = kHeight * 0.078;
    CGFloat carSSTxtX = 0;
    CGFloat carSSTxtY = CGRectGetMaxY(self.carBrandTxt.frame) + hangjv;
    self.carSSTxt = [[GFTextFieldView alloc] initWithFrame:CGRectMake(carSSTxtX, carSSTxtY, carSSTxtW, carSSTxtH) withLeftName:@"车系"];
    [self.view addSubview:self.carSSTxt];
    
    
    // 总行驶里程
    CGFloat ODOTxtW = kWidth;
    CGFloat ODOTxtH = kHeight * 0.078;
    CGFloat ODOTxtX = 0;
    CGFloat ODOTxtY = CGRectGetMaxY(self.carSSTxt.frame) + hangjv;
    self.ODOTxt = [[GFTextFieldView alloc] initWithFrame:CGRectMake(ODOTxtX, ODOTxtY, ODOTxtW, ODOTxtH) withLeftName:@"总行驶里程"];
    [self.view addSubview:self.ODOTxt];
    // 单位“km”
    CGFloat kmLabW = kWidth * 0.13;
    CGFloat kmLabH = ODOTxtH;
    CGFloat kmLabX = ODOTxtW - kmLabW;
    CGFloat kmLabY = 0;
    UILabel *kmLab = [[UILabel alloc] initWithFrame:CGRectMake(kmLabX, kmLabY, kmLabW, kmLabH)];
    kmLab.font = [UIFont systemFontOfSize:14 / 320.0 * kWidth];
    kmLab.text = @"km";
    [self.ODOTxt addSubview:kmLab];
    
    // 发动机类型
    CGFloat enginTxtW = kWidth;
    CGFloat enginTxtH = kHeight * 0.078;
    CGFloat enginTxtX = 0;
    CGFloat enginTxtY = CGRectGetMaxY(self.ODOTxt.frame) + hangjv;
    self.enginTxt = [[GFTextFieldView alloc] initWithFrame:CGRectMake(enginTxtX, enginTxtY, enginTxtW, enginTxtH) withLeftName:@"发动机类型"];
    [self.view addSubview:self.enginTxt];
    
    // 排气量
    CGFloat OCTxtW = kWidth;
    CGFloat OCTxtH = kHeight * 0.078;
    CGFloat OCTxtX = 0;
    CGFloat OCTxtY = CGRectGetMaxY(self.enginTxt.frame) + hangjv;
    self.OCTxt = [[GFTextFieldView alloc] initWithFrame:CGRectMake(OCTxtX, OCTxtY, OCTxtW, OCTxtH) withLeftName:@"排气量"];
    [self.view addSubview:self.OCTxt];
    // 单位“L”
    CGFloat lLabW = kWidth * 0.13;
    CGFloat lLabH = OCTxtH;
    CGFloat lLabX = OCTxtW - lLabW;
    CGFloat lLabY = 0;
    UILabel *lLab = [[UILabel alloc] initWithFrame:CGRectMake(lLabX, lLabY, lLabW, lLabH)];
    lLab.font = [UIFont systemFontOfSize:14 / 320.0 * kWidth];
    lLab.text = @"L";
    [self.OCTxt addSubview:lLab];
    
    // 车龄
    CGFloat ageTxtW = kWidth;
    CGFloat ageTxtH = kHeight * 0.078;
    CGFloat ageTxtX = 0;
    CGFloat ageTxtY = CGRectGetMaxY(self.OCTxt.frame) + hangjv;
    self.ageTxt = [[GFTextFieldView alloc] initWithFrame:CGRectMake(ageTxtX, ageTxtY, ageTxtW, ageTxtH) withLeftName:@"车龄"];
    [self.view addSubview:self.ageTxt];

    // 提交按钮
    CGFloat submitBtnW = kWidth - 2 * jianjv;
    CGFloat submitBtnH = kHeight * 0.065;
    CGFloat submitBtnX = jianjv;
    CGFloat submitBtnY = CGRectGetMaxY(self.ageTxt.frame) + kHeight * 0.042;
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(submitBtnX, submitBtnY, submitBtnW, submitBtnH);
    submitBtn.backgroundColor = [UIColor greenColor];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:19];
    [self.view addSubview:submitBtn];
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    // 智车服务协议
    CGFloat accordLabW = kWidth;
    CGFloat accordLabH = kHeight * 0.042;
    CGFloat accordLabX = 0;
    CGFloat accordLabY = CGRectGetMaxY(submitBtn.frame) + 5 / 320.0 * kWidth;
    UILabel *accordLab = [[UILabel alloc] initWithFrame:CGRectMake(accordLabX, accordLabY, accordLabW, accordLabH)];
    accordLab.textColor = [UIColor colorWithRed:141 / 255.0 green:142 / 255.0 blue:143.0 / 255.0 alpha:1];
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:@"点击提交按钮表示您同意《智车服务协议》"];
    [mStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(11,8)];
    accordLab.attributedText = mStr;
    accordLab.font = [UIFont systemFontOfSize:11 / 320.0 * kWidth];
    accordLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:accordLab];
    // 智车服务协议按钮
    CGFloat accordBtnW = submitBtnW - 40 / 320.0 * kWidth;
    CGFloat accordBtnH = accordLabH;
    CGFloat accordBtnX = (kWidth - accordBtnW) / 2.0;
    CGFloat accordBtnY = accordLabY;
    UIButton *accordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    accordBtn.frame = CGRectMake(accordBtnX, accordBtnY, accordBtnW, accordBtnH);
    [self.view addSubview:accordBtn];
    [accordBtn addTarget:self action:@selector(accordBtnClick) forControlEvents:UIControlEventTouchUpInside];
}


- (void)submitBtnClick {

    NSLog(@"注册信息已提交");
    GFSignInViewController *signVC = [[GFSignInViewController alloc] init];
    [self.navigationController pushViewController:signVC animated:YES];
    
    
    
    
}


- (void)accordBtnClick {
     NSLog(@"我是协议");
    
    GFDelegateViewController *delegateView = [[GFDelegateViewController alloc]init];
    delegateView.delegateTitle = @"ssbb";
    [self.navigationController pushViewController:delegateView animated:YES];
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
