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
#import "ZBSignInViewController.h"
#import "HNPPersonVC.h"

@interface AppDelegate ()

@property(nonatomic,strong)ZBPersonModel *mineUserInfoModel;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    self.window.rootViewController = tabVC;
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];

    
    
    ZBMainViewController *mainVC = [[ZBMainViewController alloc] init];
    mainVC.tabBarItem.title = @"首页";
    mainVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home_icon_normal"];
    mainVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_icon_selected"];
    [tabVC addChildViewController:mainVC];


    
    
     ZBDiscoverMainVC *findVC = [[ZBDiscoverMainVC alloc] init];
       findVC.tabBarItem.title = @"发现";
       findVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_find_icon_normal"];
    findVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_find_icon_selected"];
        [tabVC addChildViewController:findVC];
    
    [self determineWhetherToLogin];
    

    ZBMineViewController *mineVC = [[ZBMineViewController alloc] init];
    UINavigationController *mineNavVC = [[UINavigationController alloc] init];
    [mineNavVC addChildViewController:mineVC];
    mineNavVC.navigationBar.hidden = YES;
    mineNavVC.tabBarItem.title = @"我的";
    mineNavVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_mine_icon_normal"];
    mineNavVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_mine_icon_selected"];
    [tabVC addChildViewController:mineNavVC];
    
    
    
    [self.window makeKeyAndVisible];
  return YES;
}


#pragma mark - 判断是否登录
/**判断是否登录*/
- (void)determineWhetherToLogin
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/user.plist"];
//    NSString *path =[[NSBundle mainBundle] pathForResource:@"user.plist" ofType:nil];
    self.mineUserInfoModel = [ZBPersonModel mj_objectWithFile:path];
    if (self.mineUserInfoModel == nil) {
        self.login = NO;
    } else {
        self.login = YES;
    }
}

@end
