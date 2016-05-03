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

#import "CLDrawRadialGradientView.h"

#import "GFHttpTool.h"




@interface ViewController ()
{
    CLDrawRadialGradientView *_radialView;
}




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor cyanColor];
 
    
    
    



//    GFTipView *tip3 = [[GFTipView alloc] initWithHeight:500 WithMessage:@"请求失败" withViewController:self withShowTimw:5];
//    [tip3 tipViewShow];
//
//    CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
////    CGFloat kHeight = [UIScreen mainScreen].bounds.size.height;
//    GFTextFieldView *txtview = [[GFTextFieldView alloc] initWithFrame:CGRectMake(0, 50, kWidth, 50) withLeftImgName:@"1"];
//    [self.view addSubview:txtview];
//    txtview.textField.placeholder = @"sdfhaskdhgkas";
//    
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(0, 0, 100, 200);
//    btn.backgroundColor = [UIColor greenColor];
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    GFTextFieldView *txtvv = [[GFTextFieldView alloc] initWithFrame:CGRectMake(0, 150, kWidth, 50) withLeftImgName:@"1" withRightButton:btn withBtnImgName:@"2"];
//    [self.view addSubview:txtvv];
//
    
    
    _radialView = [[CLDrawRadialGradientView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    _radialView.center = self.view.center;
    _radialView.backgroundColor = [UIColor whiteColor];
    [_radialView setLabel];
    [self.view addSubview:_radialView];
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(getData) userInfo:nil repeats:YES];
    
    
}


- (void)getData{
    static float i = 0;
    i++;
    NSLog(@"--%f---",i);
    _radialView.angle = i;
    [_radialView setNeedsDisplay];
    
    


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    
//    [GFHttpTool userMsgGetWithParameters:nil success:^(id responseObject) {
//        
//        
//        NSLog(@"%@", responseObject);
//        
//    } failure:^(NSError *error) {
//        
//    }];
//    
//    NSMutableDictionary *mdic = [[NSMutableDictionary alloc] init];
//    mdic[@"nick"] = @"老五";
//    mdic[@"city"] = @"中国";
//    mdic[@"province"] = @"亚洲";
//    mdic[@"headimgurl"] = @"http://banbao.chazidian.com/uploadfile/2016-01-25/s145368924044608.jpg";
//    [GFHttpTool updataUserPostWithParameters:mdic success:^(id responseObject) {
//        
//        NSLog(@"%@", responseObject);
//        
//        
//    } failure:^(NSError *error) {
//        
//    }];
//
}


- (void)btnClick {

    NSLog(@"我是按钮");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
