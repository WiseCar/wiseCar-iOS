//
//  GFTipView.m
//  WiseCar
//
//  Created by 陈光法 on 16/4/26.
//  Copyright © 2016年 mll. All rights reserved.
//

#import "GFTipView.h"

@implementation GFTipView


/**
 *  加载、网络请求“进度条”
 *
 *  @param tipName 进度条下方的文本
 */
+ (instancetype)tipViewWithJinduTiaoTipName:(NSString *)tipName {
    
    NSMutableArray *mArr = [[NSMutableArray alloc] init];
    
    CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat kHeight = [UIScreen mainScreen].bounds.size.height;
    
    
    GFTipView *tipView = [[GFTipView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    tipView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
    
    
    CGFloat baseViewW = 150 / 320.0 * kWidth;
    CGFloat baseViewH = 90 / 568.0 * kHeight;
    CGFloat baseViewX = (kWidth - baseViewW) / 2.0;
    CGFloat baseViewY = (kHeight - baseViewH) / 2.0 - 50;
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(baseViewX, baseViewY, baseViewW, baseViewH)];
    baseView.backgroundColor = [UIColor whiteColor];
    baseView.layer.cornerRadius = 5;
    [tipView addSubview:baseView];

    
    
    CGFloat imgViewW = 40 / 320.0 * kWidth;
    CGFloat imgViewH = 40 / 320.0 * kWidth;
    CGFloat imgViewX = (baseViewW - 50) / 2.0;
    CGFloat imgViewY = 10;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(imgViewX, imgViewY, imgViewW, imgViewH)];
    for(int i=1; i<9; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png", i]];
        [mArr addObject:image];
        
    }
    
    imgView.animationImages = mArr;
    
    imgView.animationDuration = 1.2;
    [imgView startAnimating];
    
    [baseView addSubview:imgView];
    
    
    CGFloat labW = baseViewW;
    CGFloat labH = 35 / 320.0 * kWidth;
    CGFloat labX = 0;
    CGFloat labY = CGRectGetMaxY(imgView.frame);
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(labX, labY, labW, labH)];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = [UIColor blackColor];
    lab.font = [UIFont systemFontOfSize:13 / 320.0 * kWidth];
    lab.text = tipName;
    [baseView addSubview:lab];
    
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:tipView];
    
    
    return tipView;
    
}





/**
 *  手动设置高度
 *
 *  @param height         tipView显示的高度
 *  @param messageStr     提示的文本内容
 *  @param viewController tipView所在的控制器，添加tipView控件
 *  @param times          显示时间
 */
- (instancetype)initWithHeight:(CGFloat)height WithMessage:(NSString *)messageStr withViewController:(UIViewController *)viewController withShowTimw:(CGFloat)times {
    
    self = [super init];
    
    if(self != nil) {
        
        
        CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
        
        self.frame = [UIScreen mainScreen].bounds;
        
        NSString *str = messageStr;
        NSMutableDictionary *attDic = [[NSMutableDictionary alloc] init];
        attDic[NSFontAttributeName] = [UIFont systemFontOfSize:15 / 320.0 * kWidth];
        attDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
        CGRect strRect = [str boundingRectWithSize:CGSizeMake(kWidth - 90, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attDic context:nil];
        
        CGFloat tipViewW = strRect.size.width + 30;
        CGFloat tipViewH = strRect.size.height + 10;
        CGFloat tipViewX = (kWidth - tipViewW) / 2.0;
        CGFloat tipViewY = height;
        UIView *tipView = [[UIView alloc] initWithFrame:CGRectMake(tipViewX, tipViewY, tipViewW, tipViewH)];
        tipView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        tipView.layer.cornerRadius = 7.5;
        [self addSubview:tipView];
        
        CGFloat msgLabW = tipViewW;
        CGFloat msgLabH = tipViewH;
        CGFloat msgLabX = 0;
        CGFloat msgLabY = 0;
        UILabel *msgLab = [[UILabel alloc] initWithFrame:CGRectMake(msgLabX, msgLabY, msgLabW, msgLabH)];
        msgLab.text = messageStr;
        [tipView addSubview:msgLab];
        msgLab.textAlignment = NSTextAlignmentCenter;
        msgLab.font = [UIFont systemFontOfSize:15 / 320.0 * kWidth];
        msgLab.textColor = [UIColor whiteColor];
        
        [viewController.view addSubview:self];
        
        self.hidden = YES;
        
        time = times;
    }
    
    return self;
}





/**
 *  默认高度
 *
 *  @param messageStr     提示文本内容
 *  @param viewController tipView所在的控制器，添加tipView控件
 *  @param times          显示时间
 */
- (instancetype)initWithNormalHeightWithMessage:(NSString *)messageStr withViewController:(UIViewController *)viewController withShowTimw:(CGFloat)times {
    
    self = [super init];
    
    if(self != nil) {
        
        
        CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat kHeight = [UIScreen mainScreen].bounds.size.height;
        
        self.frame = [UIScreen mainScreen].bounds;
        
        NSString *str = messageStr;
        NSMutableDictionary *attDic = [[NSMutableDictionary alloc] init];
        attDic[NSFontAttributeName] = [UIFont systemFontOfSize:14 / 320.0 * kWidth];
        attDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
        CGRect strRect = [str boundingRectWithSize:CGSizeMake(kWidth - 90, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attDic context:nil];
        
        CGFloat tipViewW = strRect.size.width;
        CGFloat tipViewH = strRect.size.height + 10;
        CGFloat tipViewX = (kWidth - tipViewW) / 2.0;
        CGFloat tipViewY = kHeight * 0.8;
        UIView *tipView = [[UIView alloc] initWithFrame:CGRectMake(tipViewX-20, tipViewY, tipViewW+40, tipViewH)];
        tipView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        tipView.layer.cornerRadius = 7.5;
        [self addSubview:tipView];
        
        CGFloat msgLabW = tipViewW;
        CGFloat msgLabH = tipViewH;
        CGFloat msgLabX = 0;
        CGFloat msgLabY = 0;
        UILabel *msgLab = [[UILabel alloc] initWithFrame:CGRectMake(msgLabX, msgLabY, msgLabW+40, msgLabH)];
        
        msgLab.text = messageStr;
        [tipView addSubview:msgLab];
        msgLab.textAlignment = NSTextAlignmentCenter;
        msgLab.numberOfLines = 0;
        msgLab.font = [UIFont systemFontOfSize:15 / 320.0 * kWidth];
        msgLab.textColor = [UIColor whiteColor];
        
        [viewController.view addSubview:self];
        
        self.hidden = YES;
        
        time = times;
    }
    
    return self;
}





/**
 *  默认高度；添加到window上
 *
 *  @param messageStr 提示文本内容
 *  @param times      显示时间
 */
- (instancetype)initWithNormalHeightWithMessage:(NSString *)messageStr withShowTimw:(CGFloat)times {

    self = [super init];
    
    if(self != nil) {
        
        
        CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat kHeight = [UIScreen mainScreen].bounds.size.height;
        
        self.frame = [UIScreen mainScreen].bounds;
        
        NSString *str = messageStr;
        NSMutableDictionary *attDic = [[NSMutableDictionary alloc] init];
        attDic[NSFontAttributeName] = [UIFont systemFontOfSize:14 / 320.0 * kWidth];
        attDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
        CGRect strRect = [str boundingRectWithSize:CGSizeMake(kWidth - 90, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attDic context:nil];
        
        CGFloat tipViewW = strRect.size.width;
        CGFloat tipViewH = strRect.size.height + 10;
        CGFloat tipViewX = (kWidth - tipViewW) / 2.0;
        CGFloat tipViewY = kHeight * 0.8;
        UIView *tipView = [[UIView alloc] initWithFrame:CGRectMake(tipViewX-20, tipViewY, tipViewW+40, tipViewH)];
        tipView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        tipView.layer.cornerRadius = 7.5;
        [self addSubview:tipView];
        
        CGFloat msgLabW = tipViewW;
        CGFloat msgLabH = tipViewH;
        CGFloat msgLabX = 0;
        CGFloat msgLabY = 0;
        UILabel *msgLab = [[UILabel alloc] initWithFrame:CGRectMake(msgLabX, msgLabY, msgLabW+40, msgLabH)];
        
        msgLab.text = messageStr;
        [tipView addSubview:msgLab];
        msgLab.textAlignment = NSTextAlignmentCenter;
        msgLab.numberOfLines = 0;
        msgLab.font = [UIFont systemFontOfSize:15 / 320.0 * kWidth];
        msgLab.textColor = [UIColor whiteColor];
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
        
        self.hidden = YES;
        
        time = times;
    }
    
    
    return self;

}







/**
 *  外部建立tipView控件后，调用下面的方法显示，并且会自动移除
 */
- (void)tipViewShow {
    self.hidden = NO;
    
    [self performSelector:@selector(tipViewRemove1) withObject:nil afterDelay:time];
}
- (void)tipViewRemove1 {
    
    [self removeFromSuperview];
}





/**
 *  外部调用，用于移除tipView控件（主要与“加载、网络请求“进度条””一起调用）
 */
- (void)tipViewRemove2{
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:5];
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
