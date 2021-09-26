//
//  AppDelegate.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "AppDelegate.h"
#import "LYNavBaseVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    LYNavBaseVC * one = [[LYNavBaseVC alloc] init];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController: one];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
