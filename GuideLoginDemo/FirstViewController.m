//
//  FirstViewController.m
//  GuideLoginDemo
//
//  Created by yfc on 17/5/10.
//  Copyright © 2017年 yfc. All rights reserved.
//

#import "FirstViewController.h"
#import "config.h"
#import "ZhuanZhangViewController.h"
#import "HuiKuanViewController.h"
#import "JieKuanViewController.h"
#import "RouteManager.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //随机生成三个按钮
    int width = SCREEN_WIDTH_NEW - BALL_WIDTH;
    int height = SCREEN_HEIGHT_NEW - BALL_WIDTH;
    NSArray *titleArray = @[@"转账",@"汇款",@"借款"];
    for (int i = 0; i < 3; i++) {
        int cx = 0;
        int cy = 0;
        cx = arc4random() % width;
        cy = arc4random() % height;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"0%ddog",i]] forState:UIControlStateNormal];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
        btn.tag = i;
        btn.centerY = cy;
        btn.centerX = cx;
        btn.width = 70;
        btn.height = 70;
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
}
//三个按钮的点击事件
- (void)btnClicked:(UIButton *)btnn{

    if (btnn.tag == 0) {
        [RouteManager pushViewControllerWithOriginViewController:self loginFlag:@"Y" identifier:@"ZhuanZhangViewController" otherParameters:nil];
    }else if(btnn.tag == 1){
        [RouteManager pushViewControllerWithOriginViewController:self loginFlag:@"Y" identifier:@"HuiKuanViewController" otherParameters:nil];
    }else{
        [RouteManager pushViewControllerWithOriginViewController:self loginFlag:@"Y" identifier:@"JieKuanViewController" otherParameters:nil];
    }
    
}


@end
