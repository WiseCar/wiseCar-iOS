//
//  CLDrawRadialGradientView.m
//  WiseCar
//
//  Created by 李孟龙 on 16/4/29.
//  Copyright © 2016年 mll. All rights reserved.
//

#import "CLDrawRadialGradientView.h"

@implementation CLDrawRadialGradientView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
   
    
    CGFloat components[12]={
        0.0, 0.0, 0.0, 0.1,     //start color(r,g,b,alpha)
        1.0, 1.0, 1.0, 0.5,
        0.0, 0.0, 0.0, 0.1 //end color
    };
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(space, components, NULL,3);
    
    CGFloat _sc_kd = 20;
    CGFloat _bj = (rect.size.height>rect.size.width?rect.size.width/2:rect.size.height/2)-_sc_kd/2;
    CGPoint _point = CGPointMake(rect.size.width/2, rect.size.height/2);
    CGPoint start = _point;  //开始的点
    CGPoint end = _point; //结束的点
    CGFloat startRadius = _bj+_sc_kd/2;      //半径
    CGFloat endRadius = _bj-_sc_kd/2;          //空心半径
    CGContextRef graCtx = UIGraphicsGetCurrentContext();
    CGContextDrawRadialGradient(graCtx, gradient, start, startRadius, end, endRadius, 0);
    

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画笑脸弧线
    //左
    CGContextSetRGBStrokeColor(context, 0, 255.0, 0, 1);//改变画笔颜色
    CGContextMoveToPoint(context, rect.size.height/2,5);//开始坐标p1
    CGContextSetLineWidth(context, 10);
    CGContextAddArc(context, rect.size.width/2, rect.size.height/2, rect.size.width/2-10, -M_PI_2, -M_PI_2+ M_PI*(_angle/50.0), 0);
    _numberLabel.text = [NSString stringWithFormat:@"%0.0f",_angle];
    CGContextStrokePath(context);//绘画路径

    
    
    
    
    
    
}



- (void)setLabel{

        _numberLabel = [[UILabel alloc]init];
        _numberLabel.frame = self.bounds;
        _numberLabel.text = @"0";
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_numberLabel];
    
}












@end
