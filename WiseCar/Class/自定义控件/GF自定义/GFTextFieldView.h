//
//  GFTextFieldView.h
//  WiseCar
//
//  Created by 陈光法 on 16/4/27.
//  Copyright © 2016年 mll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFTextFieldView : UIView

@property (nonatomic, strong) UITextField *textField;


/**
 *  左边带头像的输入框
 *
 *  @param frame    输入框的尺寸和位置
 *  @param leftName 左边头像的图片名
 */
- (instancetype)initWithFrame:(CGRect)frame withLeftImgName:(NSString *)leftName;




/**
 *  左边带头像、右边带按钮的输入框
 *
 *  @param frame    输入框的尺寸和位置
 *  @param leftName 左边头像的图片名
 *  @param rightBtn 右边按钮（需外部初始化传入，，按钮可以不用设置尺寸和坐标）
 *  @param imgName  按钮图片
 */
- (instancetype)initWithFrame:(CGRect)frame withLeftImgName:(NSString *)leftName withRightButton:(UIButton *)Btn withBtnNorImgName:(NSString *)norImgName withBtnHigImgName:(NSString *)higImgName;




- (instancetype)initWithFrame:(CGRect)frame withLeftName:(NSString *)leftName;




@end
