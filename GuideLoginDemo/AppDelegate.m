//
//  AppDelegate.m
//  GuideLoginDemo
//
//  Created by yfc on 17/5/10.
//  Copyright © 2017年 yfc. All rights reserved.
//

#import "AppDelegate.h"
#import "config.h"
#import "FirstViewController.h"
@interface AppDelegate (){
    UITabBarController                  *tabBarController;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //
    //初始化window
    //
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_NEW, SCREEN_HEIGHT_NEW)];
    self.window.backgroundColor = [UIColor whiteColor];
    //
    //array：存放4个FirstViewController
    //
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:4];
    
    NSArray *titleArray = @[@"微信",@"通讯录",@"发现",@"我"];
    
    for(int i = 0 ; i < 4 ; i ++){
        FirstViewController *controller_ = [[FirstViewController alloc]init];
        
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:titleArray[i] image:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]] tag:i];
        controller_.tabBarItem = item;
        
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:controller_];
        [array addObject:navi];

        if (i == 0) {
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"b%d",i+1]]];
            imageView.frame = self.window.frame;
            [controller_.view addSubview:imageView];
            
        }
    }
    
    
    tabBarController = [[UITabBarController alloc]init];
    
    tabBarController.viewControllers = array;
    
    tabBarController.delegate = self;
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
