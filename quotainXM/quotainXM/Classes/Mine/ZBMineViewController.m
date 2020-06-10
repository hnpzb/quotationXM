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

@interface ZBMineViewController ()

@end

@implementation ZBMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addChildVC];
    
}
-(void)addChildVC{
    ZBloginViewController *vc = [[ZBloginViewController alloc] init];
//    [self.view addSubview:vc.view];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"1");
//    ZBloginViewController *vc = [[ZBloginViewController alloc] init];
//     [self.navigationController pushViewController:vc animated:YES];
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
