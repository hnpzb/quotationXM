//
//  ZBResetPasswordController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/8.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBResetPasswordController.h"
#import "ZBFoundPasswordController.h"
#import "ZBInputCodeView.h"
#import "MBProgressHUD+XMG.h"
#import <AFNetworking.h>

@interface ZBResetPasswordController ()
@property (strong, nonatomic) IBOutlet UITextField *number_F;

@property (strong, nonatomic) IBOutlet UITextField *code_f;
@property (strong, nonatomic) IBOutlet UIButton *code_btn;

@end

@implementation ZBResetPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
    self.number_F.attributedText = string;

    NSMutableAttributedString *string_tow = [[NSMutableAttributedString alloc] initWithString:@"" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:201/255.0 green:207/255.0 blue:214/255.0 alpha:1.0]}];
    self.code_f.attributedText = string_tow;
    
   

    NSMutableAttributedString *string_three = [[NSMutableAttributedString alloc] initWithString:@"" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:254/255.0 green:254/255.0 blue:255/255.0 alpha:1.0]}];
    self.code_btn.titleLabel.attributedText = string_three;

}
- (IBAction)next:(id)sender {
    ZBFoundPasswordController *vc = [[ZBFoundPasswordController alloc] init];
    vc.phone = _number_F.text;
    vc.code = _code_f.text;
    if (_number_F.text.length != 0 && _code_f.text.length != 0) {
         [self presentViewController:vc animated:YES completion:nil];
    }else{
        [MBProgressHUD showError:@"输入未完成"];
    }
   
    
}
- (IBAction)guanbi:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)yanzhengCode:(id)sender {
    ZBInputCodeView *vc = [[ZBInputCodeView alloc] init];
    vc.phone = _number_F.text;
    vc.type = @"3";
    [self presentViewController:vc animated:YES completion:nil];
}


- (IBAction)codeClick:(UITextField *)sender {
    [_number_F resignFirstResponder];
}
- (IBAction)contiueClick:(UITextField *)sender {
    [_code_f resignFirstResponder];
}

@end
