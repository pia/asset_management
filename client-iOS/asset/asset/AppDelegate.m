//
//  AppDelegate.m
//  asset
//
//  Created by pia on 09/02/2017.
//  Copyright © 2017 pia. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ScanViewController.h"
#import "WelcomeViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
//    self.tabController = [[UITabBarController alloc] init];
//    
//    //初始化左边视图
//    ViewController *viewLeft=[[ViewController alloc] init];
//    viewLeft.view.backgroundColor=[UIColor whiteColor];
//    viewLeft.title=@"搜索";
//    
//    //初始化右边视图
//    ScanViewController *viewRight = [[ScanViewController alloc] init];
//    viewRight.title=@"扫一扫";
//    UIImage *cameraIcon = [[UIImage imageNamed:@"Camera"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
//    UITabBarItem *rightTabItem=[[UITabBarItem alloc] initWithTitle:@"扫一扫" image:cameraIcon tag:2];
//    viewRight.tabBarItem=rightTabItem;
//
//    //分别管理两个不同的栈
//    UINavigationController *naviFirst = [[UINavigationController alloc] initWithRootViewController:viewLeft];
//    UINavigationController *naviSecond = [[UINavigationController alloc] initWithRootViewController:viewRight];
//    self.tabController.viewControllers = @[naviSecond, naviFirst];
//    self.window.rootViewController = self.tabController;
    
    WelcomeViewController *we = [[WelcomeViewController alloc] init];
    self.window.rootViewController = we;

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
