//
//  ZBResetPasswordController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/8.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBResetPasswordController.h"
#import "ZBFoundPasswordController.h"

@interface ZBResetPasswordController ()
@property (strong, nonatomic) IBOutlet UITextField *number_F;
@property (strong, nonatomic) IBOutlet UITextField *code_f;
@property (strong, nonatomic) IBOutlet UIButton *code_btn;

@end

@implementation ZBResetPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"15423568415" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
    self.number_F.attributedText = string;

    NSMutableAttributedString *string_tow = [[NSMutableAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:201/255.0 green:207/255.0 blue:214/255.0 alpha:1.0]}];
    self.code_f.attributedText = string_tow;
    
   

    NSMutableAttributedString *string_three = [[NSMutableAttributedString alloc] initWithString:@"获取验证码" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:254/255.0 green:254/255.0 blue:255/255.0 alpha:1.0]}];
    self.code_btn.titleLabel.attributedText = string_three;

}
- (IBAction)next:(id)sender {
    ZBFoundPasswordController *vc = [[ZBFoundPasswordController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)guanbi:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
