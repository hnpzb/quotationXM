//
//  ZBPingBiViewController.m
//  quotainXM
//
//  Created by 朱彬 on 2020/7/1.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBPingBiViewController.h"

@interface ZBPingBiViewController ()

@end

@implementation ZBPingBiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)clickPingBi:(id)sender {
//    NSLog(@"开始屏蔽用户");
    [self ZBbeginPingBi];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)ZBbeginPingBi{
    
//    NSInteger curTimeTap = [HNPFabuVC getNowTimestamp];
    
    NSMutableDictionary *par = [[NSMutableDictionary alloc]init];
//    [par setObject:self.userID forKey:@"userId"];
 
    [par setObject:self.userID forKey:@"userId"];
    [par setObject:self.userID forKey:@"data"];
    [par setObject:@1 forKey:@"type"];
    
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   
    [manager POST:@"http://api.yysc.online/user/personal/block" parameters:par headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        NSDictionary *data = responseObject;
//        NSLog(@"%@",data);
        NSString *success = [NSString stringWithFormat:@"%@",data[@"success"]];
        if ([success isEqualToString:@"1"]) {
             [MBProgressHUD hideHUD];
            [MBProgressHUD showMessage:@"成功屏蔽该用户..."];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"PingBi" object:nil];
            
            //延时执行代码
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 [MBProgressHUD hideHUD];
                [self dismissViewControllerAnimated:YES completion:nil];
            
                });
        }else{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"屏蔽失败"];
        }
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"屏蔽失败"];
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
