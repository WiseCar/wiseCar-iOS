//
//  GFTextFieldView.m
//  WiseCar
//
//  Created by 陈光法 on 16/4/27.
//  Copyright © 2016年 mll. All rights reserved.
//

#import "GFTextFieldView.h"

@implementation GFTextFieldView


/**
 *  左边带头像的输入框
 *
 *  @param frame    输入框的尺寸和位置
 *  @param leftName 左边头像的图片名
 */
- (instancetype)initWithFrame:(CGRect)frame withLeftImgName:(NSString *)leftName {

    self = [super init];
    
    if(self != nil) {
        
        CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
        
        self.frame = frame;
        
        // 基础View
        CGFloat baseViewW = frame.size.width;
        CGFloat baseViewH = frame.size.height;
        CGFloat baseViewX = 0;
        CGFloat baseViewY = 0;
        UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(baseViewX, baseViewY, baseViewW, baseViewH)];
        baseView.backgroundColor = [UIColor whiteColor];
        [self addSubview:baseView];
        
        // 左边视图
        CGFloat leftImgViewW = kWidth * 0.056;
        CGFloat leftImgViewH = leftImgViewW;
        CGFloat leftImgViewX = kWidth * 0.027;
        CGFloat leftImgViewY = (baseViewH - leftImgViewH) / 2.0;
        UIImageView *leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(leftImgViewX, leftImgViewY, leftImgViewW, leftImgViewH)];
        leftImgView.image = [UIImage imageNamed:leftName];
        leftImgView.contentMode = UIViewContentModeScaleAspectFit;
        [baseView addSubview:leftImgView];
//        leftImgView.backgroundColor = [UIColor greenColor];
        
        // 输入框
        CGFloat textFieldW = baseViewW - CGRectGetMaxX(leftImgView.frame) - kWidth * 0.046;
        CGFloat textFieldH = baseViewH;
        CGFloat textFieldX = CGRectGetMaxX(leftImgView.frame) + kWidth * 0.046;
        CGFloat textFieldY = 0;
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(textFieldX, textFieldY, textFieldW, textFieldH)];
        [baseView addSubview:self.textField];
//        self.textField.backgroundColor = [UIColor redColor];
        
    }
    
    return self;
}






/**
 *  左边带头像、右边带按钮的输入框
 *
 *  @param frame    输入框的尺寸和位置
 *  @param leftName 左边头像的图片名
 *  @param rightBtn 右边按钮（需外部初始化传入，，按钮可以不用设置尺寸和坐标）
 *  @param imgName  按钮图片
 */
- (instancetype)initWithFrame:(CGRect)frame withLeftImgName:(NSString *)leftName withRightButton:(UIButton *)rightBtn withBtnNorImgName:(NSString *)norImgName withBtnHigImgName:(NSString *)higImgName{

    self = [super init];
    
    if(self != nil) {
        
        CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
        
        self.frame = frame;
        
        // 基础View
        CGFloat baseViewW = frame.size.width;
        CGFloat baseViewH = frame.size.height;
        CGFloat baseViewX = 0;
        CGFloat baseViewY = 0;
        UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(baseViewX, baseViewY, baseViewW, baseViewH)];
        baseView.backgroundColor = [UIColor whiteColor];
        [self addSubview:baseView];
        
        // 左边视图
        CGFloat leftImgViewW = kWidth * 0.056;
        CGFloat leftImgViewH = leftImgViewW;
        CGFloat leftImgViewX = kWidth * 0.027;
        CGFloat leftImgViewY = (baseViewH - leftImgViewH) / 2.0;
        UIImageView *leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(leftImgViewX, leftImgViewY, leftImgViewW, leftImgViewH)];
        leftImgView.image = [UIImage imageNamed:leftName];
        leftImgView.contentMode = UIViewContentModeScaleAspectFit;
        [baseView addSubview:leftImgView];
//        leftImgView.backgroundColor = [UIColor greenColor];
        
        // 输入框
        CGFloat textFieldW = baseViewW - CGRectGetMaxX(leftImgView.frame) - kWidth * 0.046;
        CGFloat textFieldH = baseViewH;
        CGFloat textFieldX = CGRectGetMaxX(leftImgView.frame) + kWidth * 0.046;
        CGFloat textFieldY = 0;
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(textFieldX, textFieldY, textFieldW, textFieldH)];
        [baseView addSubview:self.textField];
//        self.textField.backgroundColor = [UIColor redColor];
        
        // 右边按钮
        CGFloat btnImgViewW = kWidth * 0.056;
//        CGFloat btnImgViewH = btnImgViewW;
        CGFloat btnImgViewX = baseViewW - btnImgViewW - kWidth * 0.027;
        CGFloat btnImgViewY = (baseViewH - btnImgViewW) / 2.0;
        CGFloat rightBtnW = baseViewW - btnImgViewX + 5;
        CGFloat rightBtnH = baseViewH;
        CGFloat rightBtnX = btnImgViewX - 5;
        CGFloat rightBtnY = 0;
        rightBtn.frame = CGRectMake(rightBtnX, rightBtnY, rightBtnW, rightBtnH);
        [rightBtn setImage:[UIImage imageNamed:norImgName] forState:UIControlStateNormal];
        [rightBtn setImage:[UIImage imageNamed:higImgName] forState:UIControlStateSelected];
        rightBtn.imageEdgeInsets = UIEdgeInsetsMake(btnImgViewY, 5, btnImgViewY, rightBtnW - btnImgViewW - 5);
//        rightBtn.backgroundColor = [UIColor greenColor];
        [baseView addSubview:rightBtn];
        
        
    }
    
    return self;
}



- (instancetype)initWithFrame:(CGRect)frame withLeftName:(NSString *)leftName {
    
    self = [super init];
    
    if(self != nil) {
    
        CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
        
        self.frame = frame;
        
        // 基础View
        CGFloat baseViewW = frame.size.width;
        CGFloat baseViewH = frame.size.height;
        CGFloat baseViewX = 0;
        CGFloat baseViewY = 0;
        UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(baseViewX, baseViewY, baseViewW, baseViewH)];
        baseView.backgroundColor = [UIColor whiteColor];
        [self addSubview:baseView];
        
        // 左边Label
        CGFloat leftLabW = kWidth * 0.268;
        CGFloat leftLabH = baseViewH;
        CGFloat leftLabX = kWidth * 0.037;
        CGFloat leftLabY = 0;
        UILabel *leftLab = [[UILabel alloc] initWithFrame:CGRectMake(leftLabX, leftLabY, leftLabW, leftLabH)];
        leftLab.text = leftName;
        leftLab.font = [UIFont systemFontOfSize:14 / 320.0 * kWidth];
        leftLab.textColor = [UIColor blackColor];
        [baseView addSubview:leftLab];
        
        // 右边输入框
        CGFloat textFieldW = baseViewW - leftLabW - leftLabX;
        CGFloat textFieldH = baseViewH;
        CGFloat textFieldX = CGRectGetMaxX(leftLab.frame);
        CGFloat textFieldY = 0;
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(textFieldX, textFieldY, textFieldW, textFieldH)];
        [baseView addSubview:self.textField];
        
        
    }
    
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
