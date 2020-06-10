//
//  ZBRegisterViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/5.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBRegisterViewController.h"
#import "ZBLoginMainNavVC.h"
#import "ZBFoundPasswordController.h"
#import "ZBResetPasswordController.h"

@interface ZBRegisterViewController ()

@end

@implementation ZBRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)tuichu:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)closeClick:(id)sender {
//    ZBLoginMainNavVC *vc = [[ZBLoginMainNavVC alloc] init];
//    [self.navigationController popToViewController:vc animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)registerClick:(id)sender {
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
