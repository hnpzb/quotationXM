//
//  HNPDetailsCell.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/8.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPDetailsCell.h"
#import "HNPDynamicModle.h"
#import "HNPDynamicUserModel.h"
#import "HNPDetailsVC.h"
#import <SDWebImage/SDWebImage.h>
#import "HNPCommentCell.h"
#import "ZBCommentVC.h"

@interface HNPDetailsCell ()


@property (weak, nonatomic) IBOutlet UIImageView *DetailsHeadImageView;
@property (weak, nonatomic) IBOutlet UILabel *DetailsNickName;
@property (weak, nonatomic) IBOutlet UILabel *DetailsNeirongLable;
@property (weak, nonatomic) IBOutlet UIImageView *DetailsNeirongImageView;
@property (weak, nonatomic) IBOutlet UILabel *DetailsPublishTimeLable;
@property (weak, nonatomic) IBOutlet UILabel *DetailsZanCountLable;
@property (weak, nonatomic) IBOutlet UILabel *DetailsCommentCountLable;
@property (weak, nonatomic) IBOutlet UILabel *DetailsBrowserCountLable;
@property (weak, nonatomic) IBOutlet UIButton *DetailsFollowBtn;
@property (weak, nonatomic) IBOutlet UIImageView *DetailsZanImageView;
@property (weak, nonatomic) IBOutlet UILabel *DetailsZanPeopleLable;
@property (weak, nonatomic) IBOutlet UIButton *guanzhuBtn;
//@property (strong, nonatomic) IBOutlet UIImageView *commentImageView;

@end

@implementation HNPDetailsCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addComment)];
//    [_commentImageView addGestureRecognizer:tap];
    self.DetailsFollowBtn.layer.cornerRadius = 10;
    self.DetailsFollowBtn.layer.masksToBounds= YES;
    
    self.DetailsHeadImageView.layer.cornerRadius = 15;
    self.DetailsHeadImageView.layer.masksToBounds=YES;
    
    self.DetailsNeirongImageView.layer.cornerRadius = 7.5;
    self.DetailsNeirongImageView.layer.masksToBounds = YES;
    
    self.DetailsZanImageView.layer.cornerRadius = 12.5;
    self.DetailsZanImageView.layer.masksToBounds = YES;
    
    
}

//- (IBAction)commentClick:(id)sender {
//     NSLog(@"111");
//}
- (IBAction)commentClick:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"beginComment" object:nil];
//    NSLog(@"111");
    
}


//-(void)addComment{
//    NSLog(@"111");
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+(instancetype)DetailsCellXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setXQModle:(HNPDynamicModle *)XQModle{

    _XQModle = XQModle;
    
    if ([XQModle.forwardCount isEqualToString:@"1"]) {
        [self.guanzhuBtn setBackgroundImage:[UIImage imageNamed:@"pic_bg_2"] forState:UIControlStateNormal];
        [self.guanzhuBtn setTitle:@"-关注" forState:UIControlStateNormal];
    }else{
        [self.guanzhuBtn setBackgroundImage:[UIImage imageNamed:@"pic_bg"] forState:UIControlStateNormal];
        [self.guanzhuBtn setTitle:@"+关注" forState:UIControlStateNormal];
    }

    [self.DetailsHeadImageView sd_setImageWithURL:[NSURL URLWithString:XQModle.user.head] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
    self.DetailsNickName.text = XQModle.user.nickName;
    self.DetailsNeirongLable.text = XQModle.content;
    [self.DetailsNeirongImageView sd_setImageWithURL:[NSURL URLWithString:XQModle.picture] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
    self.DetailsPublishTimeLable.text = XQModle.publishTime;
    self.DetailsZanCountLable.text = [NSString stringWithFormat:@"%@ 赞",XQModle.zanCount];
    self.DetailsCommentCountLable.text = [NSString stringWithFormat:@"%@ 评论",XQModle.commentCount];
    self.DetailsBrowserCountLable.text = [NSString stringWithFormat:@"%@ 转发",XQModle.browserCount];
    
    if ([XQModle.zanCount isEqualToString:@"0"]) {
        self.DetailsZanImageView.hidden = YES;
            }else{
                [self.DetailsZanImageView sd_setImageWithURL:[NSURL URLWithString:XQModle.picture] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];

    }
    if ([XQModle.zanCount isEqualToString:@"0"]) {
        self.DetailsZanPeopleLable.text = [NSString stringWithFormat:@"当前暂无点赞"];
            }else{
                self.DetailsZanPeopleLable.text = [NSString stringWithFormat:@"...等%@个人觉得很赞",XQModle.zanCount];

    }
    
    
}
- (IBAction)followBtn:(UIButton *)sender {
    self.guanzhuBtn.selected = !self.guanzhuBtn.selected;
    if (self.guanzhuBtn.selected) {
        [self.guanzhuBtn setBackgroundImage:[UIImage imageNamed:@"pic_bg"] forState:UIControlStateNormal];
        [self.guanzhuBtn setTitle:@"+关注" forState:UIControlStateNormal];
    }else{
        [self.guanzhuBtn setBackgroundImage:[UIImage imageNamed:@"pic_bg_2"] forState:UIControlStateNormal];
        [self.guanzhuBtn setTitle:@"-关注" forState:UIControlStateNormal];
    }
}

@end
