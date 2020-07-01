//
//  ZBJuBaoViewController.m
//  quotainXM
//
//  Created by 朱彬 on 2020/7/1.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBJuBaoViewController.h"


@interface ZBJuBaoViewController ()
@property (strong, nonatomic) IBOutlet UITextView *text_v;
@property (strong, nonatomic) IBOutlet UITextField *text_F_phoneNumber;

@end

@implementation ZBJuBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _text_v.text = @"";
    
}
- (IBAction)jubaoClick:(id)sender {
    if (self.text_v.text.length != 0) {
//        NSLog(@"开始举报");
        [self ZBbeginJuBao];
    }else{
        [MBProgressHUD showError:@"请输入举报原因"];
    }
}

-(void)ZBbeginJuBao{
    
//    NSInteger curTimeTap = [HNPFabuVC getNowTimestamp];
    
    NSMutableDictionary *par = [[NSMutableDictionary alloc]init];
//    [par setObject:self.userID forKey:@"userId"];
 
    [par setObject:self.userID forKey:@"userId"];
    [par setObject:self.talkID forKey:@"talkId"];
    [par setObject:self.text_v.text forKey:@"content"];
    [par setObject:_text_F_phoneNumber.text forKey:@"contact"];
    
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   
    [manager POST:@"http://api.yysc.online/user/talk/reportTalk" parameters:par headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        NSDictionary *data = responseObject;
//        NSLog(@"%@",data);
        NSString *success = [NSString stringWithFormat:@"%@",data[@"success"]];
        if ([success isEqualToString:@"1"]) {
             [MBProgressHUD hideHUD];
            [MBProgressHUD showMessage:@"举报成功..."];
            
            //延时执行代码
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 [MBProgressHUD hideHUD];
                [self dismissViewControllerAnimated:YES completion:nil];
            
                });
        }else{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"举报失败，重新输入"];
        }
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"举报失败，重新输入"];
        }];
        
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
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
