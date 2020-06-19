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
#import <AFNetworking.h>
#import "HNPDynamicModle.h"
#import "HNPDynamicUserModel.h"
#import "MJExtension.h"
#import "HNPLoginViewModel.h"


@interface ZBloginViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *xianshiImageV;
@property (strong, nonatomic) IBOutlet UITextField *count_F;
@property (strong, nonatomic) IBOutlet UITextField *password_F;

@property (nonatomic ,strong)NSMutableArray *loginArray;

@end

@implementation ZBloginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _count_F.userInteractionEnabled = YES;
    _xianshiImageV.userInteractionEnabled = YES;
    
    //添加手势
    UITapGestureRecognizer *xs = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(xianshi)];
    [_xianshiImageV addGestureRecognizer:xs];



}

- (IBAction)countLable:(UITextField *)sender {
    [_count_F resignFirstResponder];
}
- (IBAction)passwordLable:(UITextField *)sender {
    [_password_F resignFirstResponder];
}


-(void)xianshi{
    _password_F.secureTextEntry = !_password_F.isSecureTextEntry;
}

- (IBAction)registerClick:(id)sender {
    ZBRegisterViewController *vc = [[ZBRegisterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)logonClick:(id)sender {
    
    //提醒框
    [MBProgressHUD showMessage:@"正在努力帮你登录..."];
    

    //延时执行代码
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        NSString *count = self.count_F.text;
//        NSString *password = self.password_F.text;
//        [self loginWithCount:count password:password];
       
//    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        [self beginLogin];
    });
    
    

    

}
- (IBAction)resetPW:(id)sender {
    ZBResetPasswordController *vc = [[ZBResetPasswordController alloc] init];
//    [self.navigationController modalPresentationStyle];
    [self presentViewController:vc animated:YES completion:nil];
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
}
/*
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
    
}*/

- (IBAction)guanbiLogin:(id)sender {
    NSLog(@"guanbi");
}

-(void)beginLogin{
    NSMutableDictionary *par = [[NSMutableDictionary alloc]init];
    [par setObject:self.count_F.text forKey:@"phone"];
    [par setObject:self.password_F.text forKey:@"password"];
    [par setObject:@"1" forKey:@"type"];
    [par setObject:@"futures" forKey:@"project"];
    [par setObject:@"000000" forKey:@"code"];
      
                           
//    NSString *path = [NSString stringWithFormat:@"http://api.yysc.online/system/login?phone=%@&password=%@&type=1&project=futures&code=000000",self.count_F.text,self.password_F.text];
//    NSURL *url = [NSURL URLWithString:path];
//    NSURLSession *session = [NSURLSession sharedSession];
//    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//        NSString *success = [NSString stringWithFormat:@"%@",dict[@"success"]];
//        NSLog(@"%@",dict);
//
//        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
//        if ([success isEqualToString:@"1"]) {
//            [MBProgressHUD showMessage:@"登录成功..."];
//
//            //延时执行代码
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [MBProgressHUD hideHUD];
                
//                HNPLoginViewModel *LoginModel = [HNPLoginViewModel LoginWithDict:dict[@"data"]];
                
        HNPPersonVC *vc = [[HNPPersonVC alloc] init];

         [self.navigationController  pushViewController:vc animated:YES];
                
//            });
//        }else{
//            [MBProgressHUD hideHUD];
//            [MBProgressHUD showError:@"登录未成功"];
//        }
//    }]resume];
//                           
                                                  
                           
 
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
