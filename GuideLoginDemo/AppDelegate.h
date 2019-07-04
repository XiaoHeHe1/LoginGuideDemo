//
//  AppDelegate.h
//  GuideLoginDemo
//
//  Created by yfc on 17/5/10.
//  Copyright © 2017年 yfc. All rights reserved.
//
#import <UIKit/UIKit.h>


typedef enum JumpType{
    ROUTE_MANAGER= 0,
}MYJumpType;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow      *window;
@property (assign, nonatomic) BOOL          isLogin;
@property (assign, nonatomic) MYJumpType    jumpType;

@end

