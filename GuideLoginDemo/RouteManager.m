//
//  RouteManager.m
//  GuideLoginDemo
//
//  Created by yfc on 17/5/11.
//  Copyright © 2017年 yfc. All rights reserved.
//

#import "RouteManager.h"
#import "config.h"
static RouteManager *routeManager = nil;

@interface RouteManager ()
@property(nonatomic,assign)UIViewController *originViewController;
@property(nonatomic,retain)NSString *currentIdentifier;
@property(nonatomic,assign)RouteManager *manager_;

@end


@implementation RouteManager
+ (RouteManager*)sharedRouteManager{
    @synchronized(routeManager)
    {
        if(!routeManager)
        {
            routeManager = [[RouteManager alloc]init];
        }
    }
    return routeManager;
}


+ (void)pushViewControllerWithOriginViewController:(UIViewController *)originViewController loginFlag:(NSString *)loginFlag identifier:(const NSString *)identifier otherParameters:(NSDictionary *)parameters;{
    RouteManager *manager = [RouteManager sharedRouteManager];
    
    NSLog(@"manager=%@",manager);
    
    manager.manager_ = manager;
    [manager pushViewControllerWithOriginViewController:originViewController loginFlag:loginFlag   identifier:identifier otherParameters:parameters];
    
}
- (void)pushViewControllerWithOriginViewController:(UIViewController *)originViewController loginFlag:(NSString *)loginFlag identifier:(const NSString *)identifier otherParameters:(NSDictionary *)parameters;{
    self.originViewController = originViewController;
    self.currentIdentifier = (NSString *)identifier;

    if ([loginFlag isEqualToString:@"Y"]) {
        
        if (APPLICATION.isLogin == YES){
            [self pushViewController];
        }else{
            //引导登录
            [self setNotiObserverLogin];
        }
        
    }
    else{
        [self pushViewController];
    }
}
- (void)setNotiObserverLogin{
    
    APPLICATION.jumpType = ROUTE_MANAGER;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ROUTE_MANAGER" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushViewController) name:@"ROUTE_MANAGER" object:nil];
    
    //如果已经有登录页了 不要重复弹出
    UINavigationController *topNavi = (UINavigationController*)APPLICATION.window.rootViewController.presentedViewController;
    for (UIViewController *loginVC in topNavi.viewControllers) {
        if ([loginVC isKindOfClass:NSClassFromString(@"LoginViewController")]) {
            return;
        }
    }
    NSLog(@"%@",(APPLICATION.window.rootViewController.presentedViewController));
    
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    [APPLICATION.window.rootViewController presentViewController:loginVC animated:YES completion:^{}];

}
- (void)pushViewController{
    {
        id viewController = [[NSClassFromString(self.currentIdentifier) alloc]init];
        
        ((UIViewController *)viewController).hidesBottomBarWhenPushed = YES;
        
        if ([self.originViewController isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController*)self.originViewController pushViewController:viewController animated:YES];
        }else{

            [self.originViewController.navigationController pushViewController:viewController animated:YES];
        }
        
    }
    
}
@end
