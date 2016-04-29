//
//  ViewController.m
//  WiseCar
//
//  Created by 李孟龙 on 16/4/26.
//  Copyright © 2016年 mll. All rights reserved.
//

#import "ViewController.h"

#import "GFTipView.h"
#import "GFTextFieldView.h"
#import "GFHttpTool.h"

@interface ViewController ()





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor cyanColor];
 
    
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    
    [GFHttpTool userMsgGetWithParameters:nil success:^(id responseObject) {
        
        
        NSLog(@"%@", responseObject);
        
    } failure:^(NSError *error) {
        
    }];
    
    NSMutableDictionary *mdic = [[NSMutableDictionary alloc] init];
    mdic[@"nick"] = @"老五";
    mdic[@"city"] = @"中国";
    mdic[@"province"] = @"亚洲";
    mdic[@"headimgurl"] = @"http://banbao.chazidian.com/uploadfile/2016-01-25/s145368924044608.jpg";
    [GFHttpTool updataUserPostWithParameters:mdic success:^(id responseObject) {
        
        NSLog(@"%@", responseObject);
        
        
    } failure:^(NSError *error) {
        
    }];
}


- (void)btnClick {

    NSLog(@"我是按钮");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
