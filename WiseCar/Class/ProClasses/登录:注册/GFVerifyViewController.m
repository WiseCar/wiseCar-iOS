//
//  GFVerifyViewController.m
//  WiseCar
//
//  Created by 陈光法 on 16/4/28.
//  Copyright © 2016年 mll. All rights reserved.
//

#import "GFVerifyViewController.h"
#import "GFNavigationView.h"
#import "GFSignUpViewController.h"


@interface GFVerifyViewController () {
    
    CGFloat kWidth;
    CGFloat kHeight;
    CGFloat hangjv;
    CGFloat jianjv;
    
    NSInteger timeInt;
}

@property (nonatomic, strong) UITextField *verifyTxt;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIButton *anewBtn;



@end

@implementation GFVerifyViewController

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
    hangjv = kHeight * 0.042;
    jianjv = kWidth * 0.037;
    
    // 导航栏
    GFNavigationView *navView = [[GFNavigationView alloc] initWithLeftImgName:@"2" withLeftImgHightName:@"6" withRightImgName:nil withRightImgHightName:nil withCenterTitle:@"输入验证码" withFrame:CGRectMake(0, 0, kWidth, 64)];
    [self.view addSubview:navView];
    [navView.leftBut addTarget:self action:@selector(leftButClick) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor colorWithRed:228 / 255.0 green:229 / 255.0 blue:230 / 255.0 alpha:1];
    
    timeInt = 12;
}


- (void)_setView {
    
    // 验证码输入框
    CGFloat verifyTxtW = kWidth;
    CGFloat verifyTxtH = kHeight * 0.078;
    CGFloat verifyTxtX = 0;
    CGFloat verifyTxtY = hangjv + 64;
    self.verifyTxt = [[UITextField alloc] initWithFrame:CGRectMake(verifyTxtX, verifyTxtY, verifyTxtW, verifyTxtH)];
    self.verifyTxt.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.verifyTxt];
    self.verifyTxt.placeholder = @"请输入短信中的验证码";
    [self.verifyTxt setValue:[UIFont systemFontOfSize:(15 / 320.0 * kWidth)] forKeyPath:@"_placeholderLabel.font"];
    UIView *suojinVV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth * 0.028, 1)];
    self.verifyTxt.leftViewMode = UITextFieldViewModeAlways;
    self.verifyTxt.leftView = suojinVV;
    
    // 读秒倒计时
    CGFloat timeLabW = kWidth;
    CGFloat timeLabH = kHeight * 0.0625;
    CGFloat timeLabX = kWidth * 0.028;
    CGFloat timeLabY = CGRectGetMaxY(self.verifyTxt.frame) + 1;
    self.timeLab = [[UILabel alloc] initWithFrame:CGRectMake(timeLabX, timeLabY, timeLabW, timeLabH)];
    self.timeLab.font = [UIFont systemFontOfSize:12 / 320.0 * kWidth];
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.2ld秒后重新获取验证码", timeInt]];
    [mStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,3)];
    self.timeLab.attributedText = mStr;
    [self.view addSubview:self.timeLab];
    self.timeLab.backgroundColor = [UIColor greenColor];
    
    
    // 计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeShow) userInfo:nil repeats:YES];
    
    
    // 重新发送验证码按钮
    CGFloat anewBtnW = 130;
    CGFloat anewBtnH = timeLabH;
    CGFloat anewBtnX = timeLabX;
    CGFloat anewBtnY = timeLabY;
    self.anewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.anewBtn.frame = CGRectMake(anewBtnX, anewBtnY, anewBtnW, anewBtnH);
    [self.anewBtn setTitle:@"重新获取验证码" forState:UIControlStateNormal];
    [self.anewBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.anewBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.anewBtn.titleLabel.font = [UIFont systemFontOfSize:12 / 320.0 * kWidth];
    [self.view addSubview:self.anewBtn];
    self.anewBtn.backgroundColor = [UIColor blackColor];
    self.anewBtn.hidden = YES;
    [self.anewBtn addTarget:self action:@selector(anewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 提交按钮
    CGFloat submitBtnW = kWidth - 2 * jianjv;
    CGFloat submitBtnH = kHeight * 0.078;
    CGFloat submitBtnX = jianjv;
    CGFloat submitBtnY = CGRectGetMaxY(self.anewBtn.frame) + hangjv;
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(submitBtnX, submitBtnY, submitBtnW, submitBtnH);
    submitBtn.backgroundColor = [UIColor greenColor];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:19];
    [self.view addSubview:submitBtn];
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}



#pragma mark - 提交按钮点击事件
- (void)submitBtnClick {

    GFSignUpViewController *signupVC = [[GFSignUpViewController alloc] init];
    [self.navigationController pushViewController:signupVC animated:NO];
    
}

#pragma mark - 计时器调用事件
- (void)timeShow {

    if(timeInt < 2) {
        [self.timer invalidate];
        self.timer = nil;
        self.timeLab.hidden = YES;
        self.anewBtn.hidden = NO;
    }else {
        NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.2ld秒后重新获取验证码", --timeInt]];
        [mStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,3)];
        self.timeLab.attributedText = mStr;
    }
    
    
}

#pragma mark - 再次获取验证码事件
- (void)anewBtnClick:(UIButton *)sender {
    NSLog(@"获取验证码按钮被点击了");
    sender.hidden = YES;
    self.timeLab.hidden = NO;
    timeInt = 12;
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.2ld秒后重新获取验证码", timeInt]];
    [mStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,3)];
    self.timeLab.attributedText = mStr;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeShow) userInfo:nil repeats:YES];
    
}


#pragma mark - 导航栏返回按钮事件
- (void)leftButClick {
    
    [self.navigationController popViewControllerAnimated:YES];
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
