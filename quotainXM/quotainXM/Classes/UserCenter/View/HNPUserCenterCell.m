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
    self.UserHeadImageView.layer.cornerRadius = 37.5;
    self.UserHeadImageView.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUserCModle:(HNPDynamicModle *)UserCModle{
    _UserCModle = UserCModle;
    
    [self.UserHeadImageView sd_setImageWithURL:[NSURL URLWithString:UserCModle.user.head] placeholderImage:[UIImage imageNamed:@"58261315FFCB0F03B1F6C11F9F2957ED"]];
    self.UserNickNameLable.text = UserCModle.user.nickName;
    self.UserSignatureLable.text = UserCModle.user.signature;
    self.UserDynamicCountLable.text = UserCModle.browserCount;
    self.UserFollowCountLable.text = UserCModle.zanCount;
    self.UserFansCountLable.text = UserCModle.commentCount;
    
}



@end
