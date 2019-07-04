//
//  LoginViewController.h
//  GuideLoginDemo
//
//  Created by yfc on 17/5/10.
//  Copyright © 2017年 yfc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
- (IBAction)cannelCilcked:(id)sender;

- (IBAction)loginBtnClicked:(id)sender;
@end
