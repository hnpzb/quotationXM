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
#import <SDWebImage/SDWebImage.h>

@interface HNPPersonVC ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (strong, nonatomic) IBOutlet UILabel *signInCenter;
@property (strong, nonatomic) IBOutlet UIButton *signInBtn;

@property (strong, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *signatureLabel;

@property (strong, nonatomic) IBOutlet UILabel *talkCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *followCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *fansCountLabel;
@property(nonatomic,copy)NSString *userID;






@end

@implementation HNPPersonVC

- (void)setModel:(ZBPersonModel *)model{
    _model = model;
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:model.head]];
    _nickNameLabel.text = model.nickName;
    _signatureLabel.text = model.signature;
    _talkCountLabel.text = model.talkCount;
    _followCountLabel.text = model.followCount;
    _fansCountLabel.text = model.fansCount;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.headImageView.layer.cornerRadius = 32.5;
    self.headImageView.layer.masksToBounds=YES;
    self.signInCenter.userInteractionEnabled = YES;
    
    //轻扫返回上个界面手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView)];
    [self.view addGestureRecognizer:swipe];
    
    [_signInBtn addTarget:self action:@selector(beginSinIn) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(beginSinIn)];
    [self.signInCenter addGestureRecognizer:tap];
    
   [_headImageView sd_setImageWithURL:[NSURL URLWithString:_model.head]];
    _nickNameLabel.text = _model.nickName;
    _signatureLabel.text = _model.signature;
//    NSLog(@"%@,%@,%@",_model.talkCount,_model.followCount,_model.fansCount);
    _talkCountLabel.text = [NSString stringWithFormat:@"%@",_model.talkCount];
    _followCountLabel.text = [NSString stringWithFormat:@"%@",_model.followCount];
    _fansCountLabel.text = [NSString stringWithFormat:@"%@",_model.fansCount];
    
    _userID = [NSString stringWithFormat:@"%@",_model.userId];

}

-(void)beginSinIn{
    ZBSignInViewController *vc = [[ZBSignInViewController alloc] init];
    vc.userID = _userID;
    [self.navigationController pushViewController:vc animated:YES];
    
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
