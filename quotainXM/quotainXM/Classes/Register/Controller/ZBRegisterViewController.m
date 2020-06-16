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
#import "ZBInputCodeView.h"
#import <AFNetworking.h>

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
    
    if (_count_F.text != nil && _password_F.text != nil && _verification_code_F != nil) {
        
        [MBProgressHUD hideHUD];
        //延时执行代码
              dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                  
                  [self beginRegist];
                 
              });
    }else{
         [MBProgressHUD hideHUD];
         [MBProgressHUD showMessage:@"输入未完成..."];
    }
       
      
       
    
}

- (IBAction)yanzhengCode:(id)sender {
   
    
    if (_count_F.text.length != 0) {
        //提醒框
        ZBInputCodeView *vc= [[ZBInputCodeView alloc] init];
        vc.phone = _count_F.text;
        vc.type = @"1";
           [self presentViewController:vc animated:YES completion:nil];
        
    }else{
         [MBProgressHUD showMessage:@"请输入账号（手机号）..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
        });
    }
}
-(void)beginRegist{
    NSMutableDictionary *par = [[NSMutableDictionary alloc]init];
    [par setObject:self.count_F.text forKey:@"phone"];
    [par setObject:self.password_F.text forKey:@"password"];
    [par setObject:self.password_F.text forKey:@"confirmPassword"];
    [par setObject:self.verification_code_F.text forKey:@"code"];
    [par setObject:@"1" forKey:@"type"];
    [par setObject:@"futures" forKey:@"project"];
    

    NSLog(@"%@",par);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://api.yysc.online/system/register" parameters:par headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         [MBProgressHUD hideHUD];
        [MBProgressHUD showMessage:@"恭喜大哥注册成功"];
        //延时执行代码
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
           [self.navigationController popViewControllerAnimated:YES];
        });
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"用户名或密码错"];
        }];
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
