//
//  ZBNavigationController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/9.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBNavigationController.h"

@interface ZBNavigationController ()

@end

@implementation ZBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    return [super popViewControllerAnimated:animated];
    
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
