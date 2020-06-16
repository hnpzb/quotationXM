//
//  HNPFabuVC.m
//  quotainXM
//
//  Created by henanping on 2020/6/16.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPFabuVC.h"

@interface HNPFabuVC ()

@end

@implementation HNPFabuVC

- (void)viewDidLoad {
    [super viewDidLoad];

    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView)];
    [self.view addGestureRecognizer:swipe];
    
}
- (IBAction)backBtn:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)swipeView{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
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
