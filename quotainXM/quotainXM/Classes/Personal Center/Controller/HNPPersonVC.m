//
//  HNPPersonVC.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/8.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPPersonVC.h"
#import "HNPPersonView.h"
#import "ZBSignInViewController.h"
#import "HNPDetailsVC.h"
@interface HNPPersonVC ()<UITableViewDelegate>

@end

@implementation HNPPersonVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)dynamicClick:(UIButton *)sender
{
    HNPDetailsVC *detailsVc = [[HNPDetailsVC alloc]init];
    [self.navigationController pushViewController:detailsVc animated:YES];
}



@end
