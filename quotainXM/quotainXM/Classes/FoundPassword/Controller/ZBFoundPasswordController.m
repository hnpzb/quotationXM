//
//  ZBFoundPasswordController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/8.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBFoundPasswordController.h"
#import <AFNetworking.h>
#import "MBProgressHUD+XMG.h"

@interface ZBFoundPasswordController ()
@property (strong, nonatomic) IBOutlet UITextField *text_F;

@end

@implementation ZBFoundPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
 
    
}
- (IBAction)tuichuClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)ok:(id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
    
       [self beginReSetPassword];
   
}
-(void)beginReSetPassword{
    NSMutableDictionary *par = [[NSMutableDictionary alloc]init];
    [par setObject:self.phone forKey:@"phone"];
    [par setObject:@"futures" forKey:@"project"];
    [par setObject:self.code forKey:@"code"];
    [par setObject:self.text_F.text forKey:@"newPassword"];
    [par setObject:self.text_F.text forKey:@"confirmPassword"];

//    NSLog(@"%@",par);
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://api.yysc.online/system/resetPassword" parameters:par headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *data = responseObject;
        NSString *success = [NSString stringWithFormat:@"%@",data[@"success"]];
        NSLog(@"%@",data);
        if ([success isEqualToString:@"1"]) {
            [MBProgressHUD showMessage:@"重置成功..."];
            
            //延时执行代码
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 [MBProgressHUD hideHUD];
            [self dismissViewControllerAnimated:YES completion:nil];
                    
                });
        }else{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"重置失败"];
        }
        
        
     
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"重置失败"];
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
