//
//  GFHttpTool.m
//  GFHttpTool(AFNetworking)
//
//  Created by 陈光法 on 15/12/15.
//  Copyright © 2015年 陈光法. All rights reserved.
//*** 网络请求 ****

#import "GFHttpTool.h"
#import "AFNetworking.h"
#import "GFTipView.h"
#import "Reachability.h"


NSString *const prefixURL = @"http://dev.incardata.com.cn/wisecar";


@implementation GFHttpTool
// 模板1
+ (void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
<<<<<<< HEAD
    
    
=======
    // 去掉返回体中所有的空指针类型
    AFJSONResponseSerializer *response = (AFJSONResponseSerializer *)manager.responseSerializer;
    response.removesKeysWithNullValues = YES;
>>>>>>> GFWiseCar
    
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure) {
            failure(error);
        }
    }];
}
+ (void)post:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFJSONResponseSerializer *response = (AFJSONResponseSerializer *)manager.responseSerializer;
    response.removesKeysWithNullValues = YES;
    
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure) {
            failure(error);
        }
    }];

}
// 模板2
+ (void)getWithParameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    
    if ([GFHttpTool isConnectionAvailable]) {
    
        NSString *suffixURL = @"";
        NSString *url = [NSString stringWithFormat:@"%@%@", prefixURL, suffixURL];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        // 去掉返回体中所有的空指针类型
        AFJSONResponseSerializer *response = (AFJSONResponseSerializer *)manager.responseSerializer;
        response.removesKeysWithNullValues = YES;
       
        [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failure) {
                failure(error);
            }
        }];
        
    }else {
        
        [GFHttpTool addTipView:@"网络无链接，请检查网络"];
    }
}
+ (void)postWithParameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    
    if ([GFHttpTool isConnectionAvailable]) {
    
        NSString *suffixURL = @"";
        NSString *url = [NSString stringWithFormat:@"%@%@", prefixURL, suffixURL];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        // 去掉返回体中所有的空指针类型
        AFJSONResponseSerializer *response = (AFJSONResponseSerializer *)manager.responseSerializer;
        response.removesKeysWithNullValues = YES;
        
        [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failure) {
                failure(error);
            }
        }];
        
    }else {
        
        [GFHttpTool addTipView:@"网络无链接，请检查网络"];
    }

}

/* 光法请求 */
#pragma mark - 1.获取验证码
+ (void)verifyGetWithParameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {

    if ([GFHttpTool isConnectionAvailable]) {
        
        NSString *phone = parameters[@"phone"];
        NSString *suffixURL = @"/api/pub/sendVerifyCodeSms/";
        NSString *url = [NSString stringWithFormat:@"%@%@%@", prefixURL, suffixURL, phone];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        // 去掉返回体中所有的空指针类型
        AFJSONResponseSerializer *response = (AFJSONResponseSerializer *)manager.responseSerializer;
        response.removesKeysWithNullValues = YES;
        
        [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failure) {
                failure(error);
            }
        }];
        
    }else {
        
        [GFHttpTool addTipView:@"网络无链接，请检查网络"];
    }
}

#pragma mark - 2.检测用户标识可用性
+ (void)checkGetWithParameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    
    if ([GFHttpTool isConnectionAvailable]) {
        
        NSString *suffixURL = @"/api/pub/checkPhoneNameEmail";
        NSString *url = [NSString stringWithFormat:@"%@%@", prefixURL, suffixURL];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        // 去掉返回体中所有的空指针类型
        AFJSONResponseSerializer *response = (AFJSONResponseSerializer *)manager.responseSerializer;
        response.removesKeysWithNullValues = YES;
        
        [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failure) {
                failure(error);
            }
        }];
        
    }else {
        
        [GFHttpTool addTipView:@"网络无链接，请检查网络"];
    }
}

#pragma mark - 3.注册账户
+ (void)signupPostWithParameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    
    if ([GFHttpTool isConnectionAvailable]) {
        
        NSString *suffixURL = @"/api/pub/register";
        NSString *url = [NSString stringWithFormat:@"%@%@", prefixURL, suffixURL];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        // 去掉返回体中所有的空指针类型
        AFJSONResponseSerializer *response = (AFJSONResponseSerializer *)manager.responseSerializer;
        response.removesKeysWithNullValues = YES;
        
        [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failure) {
                failure(error);
            }
        }];
        
    }else {
        
        [GFHttpTool addTipView:@"网络无链接，请检查网络"];
    }
}

/* token请求  cookie跟后天统一*/
// [manager.requestSerializer setValue:token forHTTPHeaderField:@"Cookie"];
#pragma mark - 4.登录
+ (void)signinPostWithParameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    
    if ([GFHttpTool isConnectionAvailable]) {
        
        NSString *suffixURL = @"/api/pub/login";
        NSString *url = [NSString stringWithFormat:@"%@%@", prefixURL, suffixURL];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        // 去掉返回体中所有的空指针类型
        AFJSONResponseSerializer *response = (AFJSONResponseSerializer *)manager.responseSerializer;
        response.removesKeysWithNullValues = YES;
        
        [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            // 获取token 针对个人的操作要加
            NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage]; // 获得响应头
            NSLog(@"####################################\n---%@--",[cookieJar cookies]); // 获取响应头的数组
            NSUserDefaults *autokenValue = [NSUserDefaults standardUserDefaults];
            for (int i = 0; i < [cookieJar cookies].count; i++) {
                NSHTTPCookie *cookie = [cookieJar cookies][i]; // 实例化响应头数组对象
                
                if ([cookie.name isEqualToString:@"token"]) { // 获取响应头数组对象里地名字为Set-Cookie的对象
                    
                     //获取响应头数组对象里地名字为autoken的对象的数据，这个数据是用来验证用户身份相当于“key”
                    NSLog(@"############%@", [NSString stringWithFormat:@"%@=%@",[cookie name],[cookie value]]);

                    [autokenValue setObject:[NSString stringWithFormat:@"%@=%@", cookie.name, cookie.value] forKey:@"token"];
                    break;
                }
            }
            
            
            if(success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failure) {
                failure(error);
            }
        }];
        
    }else {
        
        [GFHttpTool addTipView:@"网络无链接，请检查网络"];
    }
}

#pragma mark - 5.重置密码
+ (void)passwordPostWithParameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    
    if ([GFHttpTool isConnectionAvailable]) {
        
        NSString *suffixURL = @"/api/pub/resetPwd";
        NSString *url = [NSString stringWithFormat:@"%@%@", prefixURL, suffixURL];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        // 去掉返回体中所有的空指针类型
        AFJSONResponseSerializer *response = (AFJSONResponseSerializer *)manager.responseSerializer;
        response.removesKeysWithNullValues = YES;
        
        [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failure) {
                failure(error);
            }
        }];
        
    }else {
        
        [GFHttpTool addTipView:@"网络无链接，请检查网络"];
    }
    


}

#pragma mark - 6.获取账户信息
//token=ZC7sjX%2BV6DZXCDzIfHOiFQ%3D%3D
+ (void)userMsgGetWithParameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    
    if ([GFHttpTool isConnectionAvailable]) {
        
        NSString *suffixURL = @"/api/mobile/user";
        NSString *url = [NSString stringWithFormat:@"%@%@", prefixURL, suffixURL];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        [manager.requestSerializer setValue:@"token=ZC7sjX%2BV6DZXCDzIfHOiFQ%3D%3D" forHTTPHeaderField:@"Cookie"];
        
        // 去掉返回体中所有的空指针类型
        AFJSONResponseSerializer *response = (AFJSONResponseSerializer *)manager.responseSerializer;
        response.removesKeysWithNullValues = YES;
        
        [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failure) {
                failure(error);
            }
        }];
        
    }else {
        
        [GFHttpTool addTipView:@"网络无链接，请检查网络"];
    }
}


#pragma mark - 7.更新账户信息
+ (void)updataUserPostWithParameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {

    if ([GFHttpTool isConnectionAvailable]) {
        
        NSString *suffixURL = @"/api/mobile/user";
        NSString *url = [NSString stringWithFormat:@"%@%@", prefixURL, suffixURL];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        [manager.requestSerializer setValue:@"token=ZC7sjX%2BV6DZXCDzIfHOiFQ%3D%3D" forHTTPHeaderField:@"Cookie"];
        
        // 去掉返回体中所有的空指针类型
        AFJSONResponseSerializer *response = (AFJSONResponseSerializer *)manager.responseSerializer;
        response.removesKeysWithNullValues = YES;
        
        [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failure) {
                failure(error);
            }
        }];
        
    }else {
        
        [GFHttpTool addTipView:@"网络无链接，请检查网络"];
    }
    

}

/************************************#################*****************************************/














#pragma mark - 判断网络连接情况
// 加号方法里只能够调用加号方法
+(BOOL)isConnectionAvailable{
    
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    
    if (!isExistenceNetwork) {
        return NO;
    }
    
    return isExistenceNetwork;
}
#pragma mark - tipView提示框
+ (void)addTipView:(NSString *)tipTitle {

    GFTipView *tipView = [[GFTipView alloc] initWithNormalHeightWithMessage:tipTitle withShowTimw:1.5];
    [tipView tipViewShow];
}

@end
