//
//  loginViewController.m
//  行情app
//
//  Created by 朱彬 on 2020/6/5.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBloginViewController.h"
#import "ZBRegisterViewController.h"
#import "ZBResetPasswordController.h"
#import "ZBResetPasswordController.h"
#import "HNPPersonVC.h"
#import "ZBSignInViewController.h"

@interface ZBloginViewController ()

@end

@implementation ZBloginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}
- (IBAction)registerClick:(id)sender {
    ZBRegisterViewController *vc = [[ZBRegisterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)logonClick:(id)sender {
//    HNPPersonVC *vc = [[HNPPersonVC alloc] init];
    HNPPersonVC *vc = [[HNPPersonVC alloc] init];
    [self.navigationController  pushViewController:vc animated:YES];
//    NSLog(@"123");
}
- (IBAction)resetPW:(id)sender {
    ZBResetPasswordController *vc = [[ZBResetPasswordController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
