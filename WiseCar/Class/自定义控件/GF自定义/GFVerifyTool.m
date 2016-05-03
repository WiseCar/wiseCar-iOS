//
//  GFVerifyTool.m
//  WiseCar
//
//  Created by 陈光法 on 16/4/28.
//  Copyright © 2016年 mll. All rights reserved.
//

#import "GFVerifyTool.h"

@implementation GFVerifyTool

/**
 *  邮箱验证
 *
 *  @param email 输入的邮箱
 */
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}





/**
 *  手机号码验证
 *
 *  @param mobile 输入的手机号
 */
+ (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以13， 15，18，17开头，八个 \d 数字字符
    //    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    //
    
    // 去掉空格
    mobile = [mobile stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$";
    
    NSPredicate *phoneText = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneText evaluateWithObject:mobile];
}





/**
 *  车牌号验证
 *
 *  @param carNo 输入车牌号
 */
+ (BOOL) validateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}





/**
 *  车型验证
 *
 *  @param CarType 输入车型
 */
+ (BOOL) validateCarType:(NSString *)CarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}






/**
 *  密码验证（8~18位由字母和数字组成）
 *
 *  @param passWord 输入密码
 */
+ (BOOL)validatePasswordA:(NSString *)passWord
{
    
    //密码 字母 数字 下划线 6-18 位  客户要求：密码：6-18位，数字，字母，下划线，至少要数字，字母两种以上不同组合，不能含有空格
    
    NSRange numberRange = [passWord rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
    NSRange letterRange = [passWord rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]];
    if (0 == numberRange.length||0 == letterRange.length) { //必须最少有一个字母与数字
        return NO;
    }
    
    NSString *passWordRegex = @"^[a-zA-Z0-9][a-zA-Z0-9_]{7,17}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}





@end
