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

#import "ZBPersonModel.h"
#import "YXCalendarView.h"

@interface ZBloginViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *xianshiImageV;
@property (strong, nonatomic) IBOutlet UITextField *count_F;
@property (strong, nonatomic) IBOutlet UITextField *password_F;

@property (nonatomic ,strong)NSMutableArray *loginArray;

@end

@implementation ZBloginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//     NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/user.plist"];
//        NSLog(@"%@",path);
    
    _count_F.userInteractionEnabled = YES;
    _xianshiImageV.userInteractionEnabled = YES;
    
    //添加手势
    UITapGestureRecognizer *xs = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(xianshi)];
    [_xianshiImageV addGestureRecognizer:xs];
    


}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.loginType = NO;
    }
    return self;
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
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backPre" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)beginLogin{
    NSMutableDictionary *par = [[NSMutableDictionary alloc]init];
    [par setObject:self.count_F.text forKey:@"phone"];
    [par setObject:self.password_F.text forKey:@"password"];
    [par setObject:@"1" forKey:@"type"];
    [par setObject:@"futures" forKey:@"project"];
    [par setObject:@"000000" forKey:@"code"];

    /*
    NSString *path = [NSString stringWithFormat:@"http://api.yysc.online/system/login?phone=%@&password=%@&type=1&project=futures&code=000000",self.count_F.text,self.password_F.text];
       NSURL *url = [NSURL URLWithString:path];
       NSURLSession *session = [NSURLSession sharedSession];
       [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
           NSString *success = [NSString stringWithFormat:@"%@",dict[@"success"]];
           NSLog(@"%@",dict);
           
           NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
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
           
           
       }]resume];*/
     
     
    

//    NSLog(@"%@",par);

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.yysc.online/system/login" parameters:par headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSDictionary *data = responseObject;
               NSString *success = [NSString stringWithFormat:@"%@",data[@"success"]];
        NSDictionary *dict = data[@"data"];
//               NSLog(@"data===%@",data);
//        NSLog(@"dict===%@",dict);
               if ([success isEqualToString:@"1"]) {
                   [MBProgressHUD showMessage:@"登录成功..."];
                   ZBPersonModel *perModel = [ZBPersonModel ZBPersonModelWithDict:dict];
//                   NSLog(@"peiModel===%@",perModel.fansCount);
                       //延时执行代码
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                           [MBProgressHUD hideHUD];
                           if (self.loginType == NO) {
                                   //存入用户数据
                                   NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/user.plist"];
                                   NSDictionary *tempDic = [perModel mj_keyValues];
                                   [tempDic writeToFile:path atomically:YES];
                                   
                               [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginSuccess" object:self];
                           }else{
                                //存入用户数据
                                NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/user.plist"];
                                NSDictionary *tempDic = [perModel mj_keyValues];
                                [tempDic writeToFile:path atomically:YES];
                               [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
                               [[NSNotificationCenter defaultCenter] postNotificationName:@"backPre" object:nil];
                                [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginSuccess" object:self];
                               [self.navigationController popViewControllerAnimated:YES];
                               
                           }
                           
                       
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




@end
