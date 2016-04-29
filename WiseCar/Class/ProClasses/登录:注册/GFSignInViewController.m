//
//  GFSignInViewController.m
//  WiseCar
//
//  Created by 陈光法 on 16/4/27.
//  Copyright © 2016年 mll. All rights reserved.
//

#import "GFSignInViewController.h"
#import "GFNavigationView.h"
#import "GFTextFieldView.h"
#import "GFVerifyViewController.h"
#import "GFTipView.h"
#import "GFVerifyTool.h"
#import "GFHttpTool.h"

@interface GFSignInViewController () {

    CGFloat kWidth;
    CGFloat kHeight;
    CGFloat hangjv;
    CGFloat jianjv;
}

@property (nonatomic, strong) UIButton *navSigninBtn;
@property (nonatomic, strong) UIButton *navSignupBtn;
@property (nonatomic, strong) UIView *signinView;
@property (nonatomic, strong) UIView *signupView;
// 登录输入框
@property (nonatomic, strong) GFTextFieldView *userTxt;
@property (nonatomic, strong) GFTextFieldView *pwdTxt;
// 注册输入框
@property (nonatomic, strong) GFTextFieldView *userTxt_up;
@property (nonatomic, strong) GFTextFieldView *phoneTxt_up;
@property (nonatomic, strong) GFTextFieldView *pwdTxt_up;

@end

@implementation GFSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 基础设置
    [self _setBase];
    
    // 界面布局
    [self _setView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 键盘收回
    [self.view endEditing:YES];
}

- (void)_setBase {

    kWidth = [UIScreen mainScreen].bounds.size.width;
    kHeight = [UIScreen mainScreen].bounds.size.height;
    hangjv = kHeight * 0.042;
    jianjv = kWidth * 0.037;
    
    // 导航栏
    GFNavigationView *navView = [[GFNavigationView alloc] initWithLeftImgName:nil withLeftImgHightName:nil withRightImgName:nil withRightImgHightName:nil withCenterTitle:nil withFrame:CGRectMake(0, 0, kWidth, 64)];
    [self.view addSubview:navView];
    
    
    // 登录注册按钮
    CGFloat baseViewW = kWidth * 0.564;
    CGFloat baseViewH = kHeight * 0.052;
    CGFloat baseViewX = (kWidth - baseViewW) / 2.0;
    CGFloat baseViewY = 20 + (44 - baseViewH) / 2.0;
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(baseViewX, baseViewY, baseViewW, baseViewH)];
    baseView.backgroundColor = [UIColor redColor];
    [self.view addSubview:baseView];
    // 登录按钮
    self.navSigninBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.navSigninBtn.frame = CGRectMake(0, 0, baseViewW / 2.0, baseViewH);
    [self.navSigninBtn setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [self.navSigninBtn setBackgroundImage:[UIImage imageNamed:@"4"] forState:UIControlStateSelected];
    [self.navSigninBtn setTitle:@"登录" forState:UIControlStateNormal];
    self.navSigninBtn.titleLabel.font = [UIFont systemFontOfSize:15.5];
    [self.navSigninBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.navSigninBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    self.navSigninBtn.selected = YES;
    self.navSigninBtn.userInteractionEnabled = NO;
    [baseView addSubview:self.navSigninBtn];
    [self.navSigninBtn addTarget:self action:@selector(navSigninBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    // 注册按钮
    self.navSignupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.navSignupBtn.frame = CGRectMake(baseViewW / 2.0, 0, baseViewW / 2.0, baseViewH);
    [self.navSignupBtn setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [self.navSignupBtn setBackgroundImage:[UIImage imageNamed:@"4"] forState:UIControlStateSelected];
    [self.navSignupBtn setTitle:@"注册" forState:UIControlStateNormal];
    self.navSignupBtn.titleLabel.font = [UIFont systemFontOfSize:15.5];
    [self.navSignupBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.navSignupBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [baseView addSubview:self.navSignupBtn];
    [self.navSignupBtn addTarget:self action:@selector(navSignupBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)_setView {

    // 登录界面
    [self _setSigninView];
    
    // 注册界面
    [self _setSignupView];
    
}

- (void)_setSigninView {

    self.signinView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64)];
    self.signinView.backgroundColor = [UIColor colorWithRed:228 / 255.0 green:229 / 255.0 blue:230 / 255.0 alpha:1];
    [self.view addSubview:self.signinView];
    self.signinView.hidden = NO;
    
    /* 获取手机号和密码 */
    NSUserDefaults *accountDef = [NSUserDefaults standardUserDefaults];
    NSArray *accountArr = [accountDef objectForKey:@"accountMsg"];
    
    // 账号输入框
    CGFloat userTxtW = kWidth;
    CGFloat userTxtH = kHeight * 0.078;
    CGFloat userTxtX = 0;
    CGFloat userTxtY = hangjv;
    self.userTxt = [[GFTextFieldView alloc] initWithFrame:CGRectMake(userTxtX, userTxtY, userTxtW, userTxtH) withLeftImgName:@"2"];
    self.userTxt.textField.placeholder = @"请输入用户名";
    [self.userTxt.textField setValue:[UIFont systemFontOfSize:(15 / 320.0 * kWidth)] forKeyPath:@"_placeholderLabel.font"];
    self.userTxt.textField.clearButtonMode = UITextFieldViewModeAlways;
    self.userTxt.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.userTxt.textField.text = accountArr[0];
    [self.signinView addSubview:self.userTxt];
    
    
    // 密码输入框
    /* 眼睛按钮 */
    UIButton *eyeBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [eyeBtn1 addTarget:self action:@selector(eyeBtn1Click:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat pwdTxtW = kWidth;
    CGFloat pwdTxtH = kHeight * 0.078;
    CGFloat pwdTxtX = 0;
    CGFloat pwdTxtY = CGRectGetMaxY(self.userTxt.frame) + 1;
    self.pwdTxt = [[GFTextFieldView alloc] initWithFrame:CGRectMake(pwdTxtX, pwdTxtY, pwdTxtW, pwdTxtH) withLeftImgName:@"2" withRightButton:eyeBtn1 withBtnNorImgName:@"1" withBtnHigImgName:@"4"];
    self.pwdTxt.textField.placeholder = @"请输入密码";
    [self.pwdTxt.textField setValue:[UIFont systemFontOfSize:(15 / 320.0 * kWidth)] forKeyPath:@"_placeholderLabel.font"];
    self.pwdTxt.textField.keyboardType = UIKeyboardTypeASCIICapable;
    self.pwdTxt.textField.secureTextEntry = YES;
    self.pwdTxt.textField.text = accountArr[1];
    [self.signinView addSubview:self.pwdTxt];
    
    
    // 忘记密码
    CGFloat forPwdBtnW = kWidth * 0.3;
    CGFloat forPwdBtnH = kHeight * 0.068;
    CGFloat forPwdBtnX = kWidth - forPwdBtnW - kWidth * 0.065;
    CGFloat forPwdBtnY = CGRectGetMaxY(self.pwdTxt.frame);
    UIButton *forPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forPwdBtn.frame = CGRectMake(forPwdBtnX, forPwdBtnY, forPwdBtnW, forPwdBtnH);
    [forPwdBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forPwdBtn setTitleColor:[UIColor colorWithRed:140 / 255.0 green:141 / 255.0 blue:142 / 255.0 alpha:1] forState:UIControlStateNormal];
    forPwdBtn.titleLabel.font = [UIFont systemFontOfSize:15 / 320.0 * kWidth];
    forPwdBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.signinView addSubview:forPwdBtn];
    
    
    // 登录按钮
    CGFloat signinBtnW = kWidth - 2 * jianjv;
    CGFloat signinBtnH = kHeight * 0.078;
    CGFloat signinBtnX = jianjv;
    CGFloat signinBtnY = CGRectGetMaxY(forPwdBtn.frame);
    UIButton *signinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    signinBtn.frame = CGRectMake(signinBtnX, signinBtnY, signinBtnW, signinBtnH);
    signinBtn.backgroundColor = [UIColor greenColor];
    [signinBtn setTitle:@"登录" forState:UIControlStateNormal];
    [signinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    signinBtn.titleLabel.font = [UIFont systemFontOfSize:19];
    [self.signinView addSubview:signinBtn];
    [signinBtn addTarget:self action:@selector(signinBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)_setSignupView {

    self.signupView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64)];
    self.signupView.backgroundColor = [UIColor colorWithRed:228 / 255.0 green:229 / 255.0 blue:230 / 255.0 alpha:1];
    [self.view addSubview:self.signupView];
    self.signupView.hidden = YES;
    
    // 账号输入框
    CGFloat userTxt_upW = kWidth;
    CGFloat userTxt_upH = kHeight * 0.078;
    CGFloat userTxt_upX = 0;
    CGFloat userTxt_upY = hangjv;
    self.userTxt_up = [[GFTextFieldView alloc] initWithFrame:CGRectMake(userTxt_upX, userTxt_upY, userTxt_upW, userTxt_upH) withLeftImgName:@"2"];
    self.userTxt_up.textField.placeholder = @"请输入用户名";
    [self.userTxt_up.textField setValue:[UIFont systemFontOfSize:(15 / 320.0 * kWidth)] forKeyPath:@"_placeholderLabel.font"];
    self.userTxt_up.textField.clearButtonMode = UITextFieldViewModeAlways;
    [self.signupView addSubview:self.userTxt_up];
    
    
    // 手机输入框
    CGFloat phoneTxt_upW = userTxt_upW;
    CGFloat phoneTxt_upH = userTxt_upH;
    CGFloat phoneTxt_upX = userTxt_upX;
    CGFloat phoneTxt_upY = CGRectGetMaxY(self.userTxt_up.frame) + 1;
    self.phoneTxt_up = [[GFTextFieldView alloc] initWithFrame:CGRectMake(phoneTxt_upX, phoneTxt_upY, phoneTxt_upW, phoneTxt_upH) withLeftImgName:@"2"];
    self.phoneTxt_up.textField.placeholder = @"+86 13888888888";
    [self.phoneTxt_up.textField setValue:[UIFont systemFontOfSize:(15 / 320.0 * kWidth)] forKeyPath:@"_placeholderLabel.font"];
    self.phoneTxt_up.textField.clearButtonMode = UITextFieldViewModeAlways;
    self.phoneTxt_up.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.signupView addSubview:self.phoneTxt_up];
    
    
    // 密码输入框
        // 眼睛按钮
    UIButton *eyeBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [eyeBtn2 addTarget:self action:@selector(eyeBtn2Click:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat pwdTxt_upW = kWidth;
    CGFloat pwdTxt_upH = kHeight * 0.078;
    CGFloat pwdTxt_upX = 0;
    CGFloat pwdTxt_upY = CGRectGetMaxY(self.phoneTxt_up.frame) + 1;
    self.pwdTxt_up = [[GFTextFieldView alloc] initWithFrame:CGRectMake(pwdTxt_upX, pwdTxt_upY, pwdTxt_upW, pwdTxt_upH) withLeftImgName:@"1" withRightButton:eyeBtn2 withBtnNorImgName:@"1" withBtnHigImgName:@"4"];
    self.pwdTxt_up.textField.placeholder = @"请输入密码";
    [self.pwdTxt_up.textField setValue:[UIFont systemFontOfSize:(15 / 320.0 * kWidth)] forKeyPath:@"_placeholderLabel.font"];
    self.pwdTxt_up.textField.keyboardType = UIKeyboardTypeASCIICapable;
    self.pwdTxt_up.textField.secureTextEntry = YES;
    [self.signupView addSubview:self.pwdTxt_up];
    
    
    // 登录按钮
    CGFloat nextBtnW = kWidth - 2 * jianjv;
    CGFloat nextBtnH = kHeight * 0.078;
    CGFloat nextBtnX = jianjv;
    CGFloat nextBtnY = CGRectGetMaxY(self.pwdTxt_up.frame) + kHeight * 0.068;
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(nextBtnX, nextBtnY, nextBtnW, nextBtnH);
    nextBtn.backgroundColor = [UIColor greenColor];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextBtn.titleLabel.font = [UIFont systemFontOfSize:19];
    [self.signupView addSubview:nextBtn];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - 导航栏登录/注册按钮点击事件
- (void)navSigninBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.navSignupBtn.selected = NO;
    if(sender.selected == YES) {
        sender.userInteractionEnabled = NO;
        self.navSignupBtn.userInteractionEnabled = YES;
        self.signinView.hidden = NO;
        self.signupView.hidden = YES;
    }
    NSLog(@"选择登录按钮");
}
- (void)navSignupBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.navSigninBtn.selected = NO;
    if(sender.selected == YES) {
        sender.userInteractionEnabled = NO;
        self.navSigninBtn.userInteractionEnabled = YES;
        self.signinView.hidden = YES;
        self.signupView.hidden = NO;
    }
    NSLog(@"选择注册按钮");
}



#pragma mark - 登录按钮点击事件
- (void)signinBtnClick {
    
    [self.view endEditing:YES];
    
    
    
    if(self.userTxt.textField.text.length == 0) {
        [self tipShow:@"用户名不能为空"];
        
    }else if(![GFVerifyTool validateMobile:self.userTxt.textField.text]) {
        [self tipShow:@"请输入正确的用户名"];
        
    }else if(self.pwdTxt.textField.text.length == 0) {
        [self tipShow:@"请输入密码"];
        
//    }else if(![GFVerifyTool validatePasswordA:self.pwdTxt.textField.text]) {
//        [self tipShow:@"请输入正确的密码"];
        
    }else {
        
        NSMutableDictionary *mDic = [[NSMutableDictionary alloc] init];
        mDic[@"phone"] = self.userTxt.textField.text;
        mDic[@"pwd"] = self.pwdTxt.textField.text;
        [GFHttpTool signinPostWithParameters:mDic success:^(id responseObject) {
            
            NSLog(@"%@", responseObject);
            NSString *status = responseObject[@"status"];
            if([status isEqualToString:@"success"]) {
                [self tipShow:@"登录成功"];
                
                /* 存储手机号和密码 */
                NSArray *accountArr = @[self.userTxt.textField.text, self.pwdTxt.textField.text];
                NSUserDefaults *accountDef = [NSUserDefaults standardUserDefaults];
                [accountDef setObject:accountArr forKey:@"accountMsg"];
                
                
                NSLog(@"登录成功");
            }else {
                
                NSString *error = responseObject[@"error"];
                [self tipShow:error];
            }
            
            
        } failure:^(NSError *error) {
            
        }];
    }
    NSLog(@"正在登录");
}


#pragma mark - 注册界面下一步按钮
- (void)nextBtnClick {
    
    [self.view endEditing:YES];
    
    if(self.userTxt_up.textField.text.length == 0) {
        [self tipShow:@"用户名不能为空"];
        
    }else if(self.phoneTxt_up.textField.text.length == 0) {
        [self tipShow:@"手机号不能为空"];
    
    }else if(![GFVerifyTool validateMobile:self.phoneTxt_up.textField.text]) {
        [self tipShow:@"请输入正确的手机号"];
        
    }else if(self.pwdTxt_up.textField.text.length == 0) {
        [self tipShow:@"密码不能为空"];
        
    }else if(![GFVerifyTool validatePasswordA:self.pwdTxt_up.textField.text]) {
        [self tipShow:@"密码由8~18未字母和数字组成"];
        
    }else {
        
        NSLog(@"下一步");
        
        /* 验证手机号是否被注册过 */
        NSMutableDictionary *mmDic = [[NSMutableDictionary alloc] init];
        mmDic[@"phone"] = self.phoneTxt_up.textField.text;
        [GFHttpTool checkGetWithParameters:mmDic success:^(id responseObject) {
            
            NSLog(@"%@", responseObject);
            
            NSInteger phoneF =  [responseObject[@"phone"] integerValue];
            if(phoneF == 1) {
                
                /* 获取验证码 */
                NSMutableDictionary *mDic = [[NSMutableDictionary alloc] init];
                mDic[@"phone"] = self.phoneTxt_up.textField.text;
                [GFHttpTool verifyGetWithParameters:mDic success:^(id responseObject) {
                    NSLog(@"%@", responseObject);
                    NSString *status = responseObject[@"status"];
                    if([status isEqualToString:@"success"]) {
                        NSLog(@"请求成功");
                        
                        GFVerifyViewController *verifyVC = [[GFVerifyViewController alloc] init];
                        verifyVC.nick = self.userTxt_up.textField.text;
                        verifyVC.phone = self.phoneTxt_up.textField.text;
                        verifyVC.pwd = self.pwdTxt_up.textField.text;
                        [self.navigationController pushViewController:verifyVC animated:NO];
                    }
                    
                } failure:^(NSError *error) {
                    
                }];
                
            }else if(phoneF == 0) {
            
                [self tipShow:@"手机号已被注册"];
            }
            
            
            
        } failure:^(NSError *error) {
           
            
            
        }];
        
    }
    
    
    
    
    
    
}

#pragma mark - 眼睛按钮
- (void)eyeBtn1Click:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    self.pwdTxt.textField.secureTextEntry = !self.pwdTxt.textField.secureTextEntry;
}
- (void)eyeBtn2Click:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    self.pwdTxt_up.textField.secureTextEntry = !self.pwdTxt_up.textField.secureTextEntry;
}









- (void)tipShow:(NSString *)tipMsg {

    GFTipView *tipView = [[GFTipView alloc] initWithNormalHeightWithMessage:tipMsg withShowTimw:1.5];
    [tipView tipViewShow];
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
