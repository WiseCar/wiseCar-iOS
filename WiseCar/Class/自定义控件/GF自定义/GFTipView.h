//
//  GFTipView.h
//  WiseCar
//
//  Created by 陈光法 on 16/4/26.
//  Copyright © 2016年 mll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFTipView : UIView {
    
    CGFloat time;
}

/**
 *  加载、网络请求“进度条”
 *
 *  @param tipName 进度条下方的文本
 */
+ (instancetype)tipViewWithJinduTiaoTipName:(NSString *)tipName;



/**
 *  默认高度
 *
 *  @param messageStr     提示文本内容
 *  @param viewController tipView所在的控制器，添加tipView控件
 *  @param times          显示时间
 */
- (instancetype)initWithNormalHeightWithMessage:(NSString *)messageStr withViewController:(UIViewController *)viewController withShowTimw:(CGFloat)times;



/**
 *  手动设置高度
 *
 *  @param height         tipView显示的高度
 *  @param messageStr     提示的文本内容
 *  @param viewController tipView所在的控制器，添加tipView控件
 *  @param times          显示时间
 */
- (instancetype)initWithHeight:(CGFloat)height WithMessage:(NSString *)messageStr withViewController:(UIViewController *)viewController withShowTimw:(CGFloat)times;




/**
 *  默认高度；添加到window上
 *
 *  @param messageStr 提示文本内容
 *  @param times      显示时间
 */
- (instancetype)initWithNormalHeightWithMessage:(NSString *)messageStr withShowTimw:(CGFloat)times;




/**
 *  外部建立tipView控件后，调用下面的方法显示，并且会自动移除
 */
- (void)tipViewShow;



/**
 *  外部调用，用于移除tipView控件（主要与“加载、网络请求“进度条””一起调用），可控制移除时间
 */
- (void)tipViewRemove2;



@end
