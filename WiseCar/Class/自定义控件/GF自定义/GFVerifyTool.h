//
//  GFVerifyTool.h
//  WiseCar
//
//  Created by 陈光法 on 16/4/28.
//  Copyright © 2016年 mll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GFVerifyTool : NSObject

//邮箱
+ (BOOL) validateEmail:(NSString *)email;
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile;
//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo;
//车型
+ (BOOL) validateCarType:(NSString *)CarType;
//密码验证（8~18位由字母和数字组成）
+ (BOOL) validatePasswordA:(NSString *)passWord;



@end
