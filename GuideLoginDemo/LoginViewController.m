//
//  LoginViewController.m
//  GuideLoginDemo
//
//  Created by yfc on 17/5/10.
//  Copyright © 2017年 yfc. All rights reserved.
//

#import "LoginViewController.h"
#import "config.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)cannelCilcked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];

}

- (IBAction)loginBtnClicked:(id)sender {
    
    if (self.userName.text.length > 0 && self.passWord.text.length > 0) {
        APPLICATION.isLogin = YES;
        
        [self dismissViewControllerAnimated:YES completion:^{
            if(APPLICATION.jumpType == ROUTE_MANAGER){
                [[NSNotificationCenter defaultCenter] postNotificationName:@"ROUTE_MANAGER" object:nil ];
            }
        }];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"输入有误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
}
@end
