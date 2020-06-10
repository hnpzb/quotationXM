//
//  AppDelegate.m
//  quotainXM
//
//  Created by 朱彬 on 2020/6/10.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "AppDelegate.h"
#import "ZBloginViewController.h"
#import "ZBRegisterViewController.h"
#import "ZBInformationViewController.h"
#import "ZBMineViewController.h"
#import "ZBMainViewController.h"
#import "HNPDiscoveryViewC.h"
#import "ZBFollowViewController.h"
#import "ZBDiscoverMainVC.h"
#import "ZBNavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    ZBloginViewController *login = [[ZBloginViewController alloc] init];
//    self.window.rootViewController = login;
//    ZBRegisterViewController *registerVC = [[ZBRegisterViewController alloc] init];
//    self.window.rootViewController = registerVC;
   
//    self.window.rootViewController = informationVC;
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    self.window.rootViewController = tabVC;
    
//     ZBInformationViewController *informationVC = [[ZBInformationViewController alloc] init];
//    informationVC.tabBarItem.title = @"首页";
//    informationVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home_icon_normal"];
//    [tabVC addChildViewController:informationVC];
    
    ZBMainViewController *mainVC = [[ZBMainViewController alloc] init];
//    mainVC.view.frame = [UIScreen mainScreen].bounds;
//    mainVC.view.frame = CGRectMake(0, 0, 200, 200);
    mainVC.tabBarItem.title = @"首页";
    mainVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home_icon_normal"];
    [tabVC addChildViewController:mainVC];
    
//    HNPDiscoveryViewC *findVC = [[HNPDiscoveryViewC alloc] init];
//    findVC.tabBarItem.title = @"发现";
//    findVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_find_icon_normal"];
//     [tabVC addChildViewController:findVC];
    
//    ZBFollowViewController
     ZBDiscoverMainVC *findVC = [[ ZBDiscoverMainVC alloc] init];
       findVC.tabBarItem.title = @"发现";
       findVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_find_icon_normal"];
        [tabVC addChildViewController:findVC];
//    ZBfindViewController *findView = [[ZBfindViewController alloc] init];
//    findView.tabBarItem.title = @"发现";
//    findView.tabBarItem.image = [UIImage imageNamed:@"tabbar_find_icon_normal"];
//    [tabVC addChildViewController:findView];
    
    ZBloginViewController *loginVC = [[ZBloginViewController alloc] init];
//    ZBMineViewController *mineVC = [[ZBMineViewController alloc] init];
    UINavigationController *mineNavVC = [[UINavigationController alloc] init];
    mineNavVC.navigationBar.hidden = YES;
    [mineNavVC addChildViewController:loginVC];
    mineNavVC.tabBarItem.title = @"我的";
    mineNavVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_mine_icon_normal"];
    [tabVC addChildViewController:mineNavVC];
    
    [self.window makeKeyAndVisible];
  return YES;
}


//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    // Override point for customization after application launch.
//
//
//
//    return YES;
//}


//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}
//

@end
