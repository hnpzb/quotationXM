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
#import "MBProgressHUD+XMG.h"

@interface ZBRegisterViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *xianshiImageV;
@property (strong, nonatomic) IBOutlet UITextField *count_F;
@property (strong, nonatomic) IBOutlet UITextField *password_F;
@property (strong, nonatomic) IBOutlet UITextField *verification_code_F;

@end

@implementation ZBRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //tianjia手势
    
    UITapGestureRecognizer *xs = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(xianshi)];
    [_xianshiImageV addGestureRecognizer:xs];
    
}

-(void)xianshi{
    _password_F.secureTextEntry = !_password_F.isSecureTextEntry;
}
- (IBAction)countLable:(UITextField *)sender {
    [_count_F resignFirstResponder ];
}
- (IBAction)verificationLable:(UITextField *)sender {
    [_verification_code_F resignFirstResponder];
}
- (IBAction)passwordLable:(UITextField *)sender {
    [_password_F resignFirstResponder];
}




- (IBAction)closeClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)registerClick:(id)sender {
    
    //提醒框
       [MBProgressHUD showMessage:@"正在努力帮你注册..."];
       
       
       //延时执行代码
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           
           NSString *count = self.count_F.text;
           NSString *password = self.password_F.text;
           NSString *code = self.verification_code_F.text;
           [self registWithCount:count verification_code:code password:password];
          
       });
       
    
}
-(void)registWithCount:(NSString *)count verification_code:(NSString *)code password:(NSString *)password{
    
   if ([count isEqualToString:@"123"] && [password isEqualToString:@"123"] &&[code isEqualToString:@"123"]) {
       //隐藏提醒框
       [MBProgressHUD hideHUD];
       ZBResetPasswordController *vc = [[ZBResetPasswordController alloc] init];
       [self.navigationController pushViewController:vc animated:YES];
      
   }else{
       //隐藏提醒框
       [MBProgressHUD hideHUD];
       [MBProgressHUD showError:@"用户名或密码或验证码错"];
   }
   
    
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
