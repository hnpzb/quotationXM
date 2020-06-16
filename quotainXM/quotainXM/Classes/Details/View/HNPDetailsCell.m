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


@end

@implementation HNPDetailsCell





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.DetailsFollowBtn.layer.cornerRadius = 10;
    self.DetailsFollowBtn.layer.masksToBounds= YES;
    
    self.DetailsHeadImageView.layer.cornerRadius = 15;
    self.DetailsHeadImageView.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//+(instancetype)DetailsCellXib
//{
//    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
//}

- (void)setXQModle:(HNPDynamicModle *)XQModle{

    _XQModle = XQModle;
    
    [self.DetailsHeadImageView sd_setImageWithURL:[NSURL URLWithString:XQModle.user.head] placeholderImage:[UIImage imageNamed:@"58261315FFCB0F03B1F6C11F9F2957ED"]];
    
    self.DetailsNickName.text = XQModle.user.nickName;
    
    self.DetailsNeirongLable.text = XQModle.content;
    
    [self.DetailsNeirongImageView sd_setImageWithURL:[NSURL URLWithString:XQModle.picture] placeholderImage:[UIImage imageNamed:@"58261315FFCB0F03B1F6C11F9F2957ED"]];
    
    self.DetailsPublishTimeLable.text = XQModle.publishTime;
    
    self.DetailsZanCountLable.text = XQModle.zanCount;
    self.DetailsZanCountLable.text = [NSString stringWithFormat:@"%@ 赞",XQModle.zanCount];
    
    self.DetailsCommentCountLable.text = XQModle.commentCount;
    self.DetailsCommentCountLable.text = [NSString stringWithFormat:@"%@ 评论",XQModle.commentCount];
    
    self.DetailsBrowserCountLable.text = XQModle.browserCount;
    self.DetailsBrowserCountLable.text = [NSString stringWithFormat:@"%@ 评论",XQModle.browserCount];

    
}

@end
