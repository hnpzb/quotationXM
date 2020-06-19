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
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;


@end

@implementation HNPPersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.headImageView.layer.cornerRadius = 32.5;
    self.headImageView.layer.masksToBounds=YES;
    //轻扫返回上个界面手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView)];
    [self.view addGestureRecognizer:swipe];

}

-(void)breakDeatail:(UIButton *)btn
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)swipeView
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)dynamicClick:(UIButton *)sender
{
    HNPDetailsVC *detailsVc = [[HNPDetailsVC alloc]init];
    [self.navigationController pushViewController:detailsVc animated:YES];
}


@end
