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
@property(nonatomic,strong)ZBPersonModel *mineUserInfoModel;
@property(nonatomic,copy)NSString *userID;






@end

@implementation HNPPersonVC

- (void)setModel:(ZBPersonModel *)model{
    _model = model;
    /*
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:model.head]];
    _nickNameLabel.text = _mineUserInfoModel.nickName;
    _signatureLabel.text = _mineUserInfoModel.signature;
    _talkCountLabel.text = _mineUserInfoModel.talkCount;
    _followCountLabel.text = _mineUserInfoModel.followCount;
    _fansCountLabel.text = _mineUserInfoModel.fansCount;*/
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
       [self determineWhetherToLogin];
       [_headImageView sd_setImageWithURL:[NSURL URLWithString:self.mineUserInfoModel.head]];
       _nickNameLabel.text = self.mineUserInfoModel.nickName;
       _signatureLabel.text = self.mineUserInfoModel.signature;
       _talkCountLabel.text = [NSString stringWithFormat:@"%@",self.mineUserInfoModel.talkCount];
       _followCountLabel.text = [NSString stringWithFormat:@"%@",self.mineUserInfoModel.followCount];
       _fansCountLabel.text = [NSString stringWithFormat:@"%@",self.mineUserInfoModel.fansCount];
       
       _userID = [NSString stringWithFormat:@"%@",self.model.userId];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self determineWhetherToLogin];
    
    
    self.headImageView.layer.cornerRadius = 32.5;
    self.headImageView.layer.masksToBounds=YES;
    self.signInCenter.userInteractionEnabled = YES;
    
    //轻扫返回上个界面手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView)];
    [self.view addGestureRecognizer:swipe];
    
    [_signInBtn addTarget:self action:@selector(beginSinIn) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(beginSinIn)];
    [self.signInCenter addGestureRecognizer:tap];
    
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:self.mineUserInfoModel.head]];
    _nickNameLabel.text = self.mineUserInfoModel.nickName;
    _signatureLabel.text = self.mineUserInfoModel.signature;
    _talkCountLabel.text = [NSString stringWithFormat:@"%@",self.mineUserInfoModel.talkCount];
    _followCountLabel.text = [NSString stringWithFormat:@"%@",self.mineUserInfoModel.followCount];
    _fansCountLabel.text = [NSString stringWithFormat:@"%@",self.mineUserInfoModel.fansCount];
    
    _userID = [NSString stringWithFormat:@"%@",self.model.userId];

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

-(void)zhuxiao{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"注销" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"点击了取消");
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"Loginzhuxiao" object:nil];
        
        //清空用户数据
        NSError *error;
        NSFileManager *fileMger = [NSFileManager defaultManager];
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/user.plist"];
        if ([fileMger removeItemAtPath:path error:&error]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"zhuxiao" object:self];
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"zhuxiao" object:self];
        }
        
        
  
    }];
    UIAlertAction *quexiaoAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //
    }];
    

    [actionSheet addAction:cancelAction];
    [actionSheet addAction:quexiaoAction];
    [self presentViewController:actionSheet animated:YES completion:nil];
}
- (IBAction)setClick:(id)sender {
    [self zhuxiao];
}

#pragma mark - 判断是否登录
/**判断是否登录*/
- (void)determineWhetherToLogin
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/user.plist"];
//    NSString *path =[[NSBundle mainBundle] pathForResource:@"user.plist" ofType:nil];
    self.mineUserInfoModel = [ZBPersonModel mj_objectWithFile:path];
    if (self.mineUserInfoModel == nil) {
        self.login = NO;
    } else {
        self.login = YES;
    }
}


@end
