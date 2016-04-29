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


NSString *const prefixURL = @"";


@implementation GFHttpTool
// 模板1
+ (void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    
    
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
