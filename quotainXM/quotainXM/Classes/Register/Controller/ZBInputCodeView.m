//
//  ZBInputCodeView.m
//  quotainXM
//
//  Created by 朱彬 on 2020/6/16.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBInputCodeView.h"
#import <AFNetworking.h>

@interface ZBInputCodeView ()
@property (strong, nonatomic) IBOutlet UIButton *refreshBtn;
@property (strong, nonatomic) IBOutlet UIImageView *imageV;
@property (strong, nonatomic) IBOutlet UITextField *text_F;

@end

@implementation ZBInputCodeView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)back:(id)sender {
    
    [self sendVerification_code];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickFreshBtn:(id)sender {
    _refreshBtn.hidden = YES;
    [self setRefreshImage];
//    self.imageV.image = [UIImage imageNamed:@"icon_guanzhu-1"];
}

-(void)setRefreshImage{
    
    NSURL *url = [NSURL URLWithString:@"http://api.yysc.online/system/sendVerify"];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSString *imageS = [NSString stringWithFormat:@"%@",dict[@"data"]];
         NSData *ImageData =[[NSData alloc]initWithBase64EncodedString:imageS options:NSDataBase64DecodingIgnoreUnknownCharacters];
       UIImage *testImage = [UIImage imageWithData:ImageData];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.imageV.image = testImage;
        }];
        
    }]resume];
}
-(void)sendVerification_code{
    
    NSMutableDictionary *par = [[NSMutableDictionary alloc]init];
    [par setObject:self.phone forKey:@"phone"];
    [par setObject:self.type forKey:@"type"];
    [par setObject:@"futures" forKey:@"project"];
    [par setObject:self.text_F.text forKey:@"code"];    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://api.yysc.online/system/sendCode" parameters:par headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"failure");
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