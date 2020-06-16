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
#import "MBProgressHUD+XMG.h"

@interface ZBloginViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *qingkongImageV;
@property (strong, nonatomic) IBOutlet UIImageView *xianshiImageV;
@property (strong, nonatomic) IBOutlet UITextField *count_F;
@property (strong, nonatomic) IBOutlet UITextField *password_F;

@end

@implementation ZBloginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _count_F.userInteractionEnabled = YES;
    _xianshiImageV.userInteractionEnabled = YES;
    //tianjia手势
    UITapGestureRecognizer *qk = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(qingkong)];
    [_qingkongImageV addGestureRecognizer:qk];
    
    UITapGestureRecognizer *xs = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(xianshi)];
    [_xianshiImageV addGestureRecognizer:xs];
    
    
}

-(void)qingkong{
    _count_F.text = @"";
    NSLog(@"qk");
}
-(void)xianshi{
    _password_F.secureTextEntry = !_password_F.isSecureTextEntry;
    NSLog(@"xs");
}


- (IBAction)registerClick:(id)sender {
    ZBRegisterViewController *vc = [[ZBRegisterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)logonClick:(id)sender {
    
    
    //提醒框
    [MBProgressHUD showMessage:@"正在努力帮你登录..."];
    
    
    //延时执行代码
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSString *count = self.count_F.text;
        NSString *password = self.password_F.text;
        [self loginWithCount:count password:password];
       
    });
    

}
- (IBAction)resetPW:(id)sender {
    ZBResetPasswordController *vc = [[ZBResetPasswordController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(Boolean)loginWithCount:(NSString *)count password:(NSString *)password{
    if ([count isEqualToString:@"123"] && [password isEqualToString:@"123"]) {
        //隐藏提醒框
        [MBProgressHUD hideHUD];
        
        HNPPersonVC *vc = [[HNPPersonVC alloc] init];
        [self.navigationController  pushViewController:vc animated:YES];
        return YES;
    }else{
        //隐藏提醒框
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"用户名或密码错"];
        return NO;
    }
    
}

- (IBAction)guanbiLogin:(id)sender {
    NSLog(@"guanbi");
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
