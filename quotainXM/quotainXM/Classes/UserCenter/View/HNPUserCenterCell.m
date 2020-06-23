//
//  HNPUserCenterCell.m
//  quotainXM
//
//  Created by henanping on 2020/6/15.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPUserCenterCell.h"
#import "HNPDynamicUserModel.h"
#import <SDWebImage/SDWebImage.h>

@interface HNPUserCenterCell ()

@property (weak, nonatomic) IBOutlet UIImageView *UserHeadImageView;
@property (weak, nonatomic) IBOutlet UILabel *UserNickNameLable;
@property (weak, nonatomic) IBOutlet UILabel *UserSignatureLable;
@property (weak, nonatomic) IBOutlet UILabel *UserDynamicCountLable;
@property (weak, nonatomic) IBOutlet UILabel *UserFollowCountLable;
@property (weak, nonatomic) IBOutlet UILabel *UserFansCountLable;


@end

@implementation HNPUserCenterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //添加关注按钮的点击手势
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchFollowBtn)];
    [self.UserQXFollowBtn addGestureRecognizer:tapGes];
    
    self.UserHeadImageView.layer.cornerRadius = 37.5;
    self.UserHeadImageView.layer.masksToBounds = YES;
    
    self.UserQXFollowBtn.layer.cornerRadius = 13.5;
    self.UserQXFollowBtn.layer.masksToBounds = YES;
}

- (void)touchFollowBtn{
    if ([self.delegate respondsToSelector:@selector(userCenterCellDidFollowBtnClick:)]) {
        [self.delegate userCenterCellDidFollowBtnClick:self];
    }
}


- (void)setUserCModle:(HNPDynamicModle *)UserCModle{
    _UserCModle = UserCModle;
    
    //根据forwardCount判断是否关注
    if ([UserCModle.forwardCount isEqualToString:@"1"]) {
        self.UserFollowBtn.hidden = YES;
        self.UserQXGZLable.text = @"取消关注";
        self.UserQXFollowBtn.backgroundColor = [UIColor whiteColor];
    }else{
        self.UserFollowBtn.hidden = NO;
        self.UserQXGZLable.text = @"点击关注";
        self.UserQXGZLable.textColor = [UIColor blackColor];
        self.UserQXFollowBtn.backgroundColor = [UIColor greenColor];
    }
    
    [self.UserHeadImageView sd_setImageWithURL:[NSURL URLWithString:UserCModle.user.head] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
    self.UserNickNameLable.text = UserCModle.user.nickName;
    self.UserSignatureLable.text = UserCModle.user.signature;
    self.UserDynamicCountLable.text = UserCModle.browserCount;
    self.UserFollowCountLable.text = UserCModle.zanCount;
    self.UserFansCountLable.text = UserCModle.commentCount;
    
}





@end
