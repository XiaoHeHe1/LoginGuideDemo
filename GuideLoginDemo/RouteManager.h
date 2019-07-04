//
//  RouteManager.h
//  GuideLoginDemo
//
//  Created by yfc on 17/5/11.
//  Copyright © 2017年 yfc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RouteManager : NSObject
+ (void)pushViewControllerWithOriginViewController:(UIViewController *)originViewController loginFlag:(NSString *)loginFlag identifier:(const NSString *)identifier otherParameters:(NSDictionary *)parameters;
@end
