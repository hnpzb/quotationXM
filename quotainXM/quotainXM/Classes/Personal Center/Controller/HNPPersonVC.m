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
@interface HNPPersonVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HNPPersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    HNPPersonView *personView = [HNPPersonView personView];
    personView.frame = self.view.bounds;
    [self.view addSubview:personView];

}

@end
