//
//  CLDrawRadialGradientView.h
//  WiseCar
//
//  Created by 李孟龙 on 16/4/29.
//  Copyright © 2016年 mll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLDrawRadialGradientView : UIView

@property (nonatomic ) CGFloat angle;

@property (nonatomic ,strong) UILabel *numberLabel;

- (void)setLabel;

@end
