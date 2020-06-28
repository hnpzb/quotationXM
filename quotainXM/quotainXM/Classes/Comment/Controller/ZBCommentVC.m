//
//  ZBCommentVC.m
//  quotainXM
//
//  Created by 朱彬 on 2020/6/28.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBCommentVC.h"

@interface ZBCommentVC ()
@property (strong, nonatomic) IBOutlet UITextView *CommentTV;

@end

@implementation ZBCommentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.view.backgroundColor = [UIColor redColor];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickFabuComment:(id)sender {
//    NSLog(@"%@",_CommentTV.text);
    [self ZBbeginFabu];
}

-(void)ZBbeginFabu{
    
//    NSInteger curTimeTap = [HNPFabuVC getNowTimestamp];
    
    NSMutableDictionary *par = [[NSMutableDictionary alloc]init];
//    [par setObject:self.userID forKey:@"userId"];
 
    [par setObject:self.userID forKey:@"userId"];
    [par setObject:self.talkID forKey:@"talkId"];
    [par setObject:self.CommentTV.text forKey:@"content"];
    [par setObject:@"" forKey:@"video"];
    [par setObject:@"" forKey:@"matchId"];
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   
    [manager POST:@"http://api.yysc.online/user/talk/commentTalk" parameters:par headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        NSDictionary *data = responseObject;
//        NSLog(@"%@",data);
        NSString *success = [NSString stringWithFormat:@"%@",data[@"success"]];
        if ([success isEqualToString:@"1"]) {
            [MBProgressHUD showMessage:@"发布成功..."];
            
            //延时执行代码
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 [MBProgressHUD hideHUD];
            
                });
        }else{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"发布失败，重新输入"];
        }
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [MBProgressHUD showError:@"发布失败，重新输入"];
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
