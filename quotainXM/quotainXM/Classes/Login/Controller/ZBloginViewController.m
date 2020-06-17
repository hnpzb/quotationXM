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

@interface ZBloginViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *xianshiImageV;
@property (strong, nonatomic) IBOutlet UITextField *count_F;
@property (strong, nonatomic) IBOutlet UITextField *password_F;

@end

@implementation ZBloginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _count_F.userInteractionEnabled = YES;
    _xianshiImageV.userInteractionEnabled = YES;
    
    //添加手势
    UITapGestureRecognizer *xs = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(xianshi)];
    [_xianshiImageV addGestureRecognizer:xs];


    
    /*
    NSString *imageS=@"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";
       
             NSData *ImageData =[[NSData alloc]initWithBase64EncodedString:imageS options:NSDataBase64DecodingIgnoreUnknownCharacters];
       //
       //
       //
       //      //        [[NSData alloc]initWithBase64EncodedString:ImageStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
       //
             UIImage *testImage = [UIImage imageWithData:ImageData];
       //
             [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                 UIImageView *imageV = [[UIImageView alloc] initWithImage:testImage];
                 [self.view addSubview:imageV];
                }];*/
       
    

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
    
    

//    NSLog(@"%@",par);
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.yysc.online/system/login" parameters:par headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSDictionary *data = responseObject;
               NSString *success = [NSString stringWithFormat:@"%@",data[@"success"]];
               NSLog(@"%@",data);
               if ([success isEqualToString:@"1"]) {
                   [MBProgressHUD showMessage:@"登录成功..."];
                   
                       //延时执行代码
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                           [MBProgressHUD hideHUD];
                       HNPPersonVC *vc = [[HNPPersonVC alloc] init];
                       [self.navigationController  pushViewController:vc animated:YES];
                       });
               }else{
                   [MBProgressHUD hideHUD];
                   [MBProgressHUD showError:@"登录未成功"];
               }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"登录失败"];
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
