//
//  ZBMineViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/5.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBMineViewController.h"
#import "ZBloginViewController.h"
#import "ZBRegisterViewController.h"
#import "ZBResetPasswordController.h"
#import "ZBFoundPasswordController.h"
#import "HNPDiscoveryViewC.h"
#import "ZBNavigationController.h"
#import "HNPPersonVC.h"

@interface ZBMineViewController ()

@property(nonatomic,strong)ZBPersonModel *mineUserInfoModel;

@end

@implementation ZBMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self addChildVC];
    [self addChildVC];
    [self loadViewOneOrTwo];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(zhuxiao) name:@"zhuxiao" object:nil];
    //LoginSuccess
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(zhuxiao) name:@"LoginSuccess" object:nil];
    
}

-(void)LoginSuccess{
    [self loadViewOneOrTwo];
}
-(void)zhuxiao{
    [self loadViewOneOrTwo];
}

-(void)addChildVC{
    
    NSArray *childClassName = @[@"ZBloginViewController",
                                @"HNPPersonVC"];
    for (NSString *className in childClassName) {
        UIViewController *vc = [[NSClassFromString(className) alloc] init];
        [self addChildViewController:vc];
    }
    
    UIViewController  *vc = self.childViewControllers[0];
    vc.view.frame = self.view.bounds;


    [self.view addSubview:vc.view];
    
    
}

-(void)loadViewOneOrTwo{
    [self determineWhetherToLogin];
    if (self.login == YES) {
           UIViewController *preVC = self.childViewControllers[0];
           [preVC.view removeFromSuperview];

           UIViewController *curVC = self.childViewControllers[1];
           
           curVC.view.frame = self.view.bounds;
           [self.view addSubview:curVC.view];
       }else{
           UIViewController *preVC = self.childViewControllers[1];
           [preVC.view removeFromSuperview];

           UIViewController *curVC = self.childViewControllers[0];
           
           curVC.view.frame = self.view.bounds;
           [self.view addSubview:curVC.view];
       }
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
