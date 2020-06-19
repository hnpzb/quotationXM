//
//  HNPCommentCell.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/8.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPCommentCell.h"
#import <SDWebImage/SDWebImage.h>
#import "HNPDynamicUserModel.h"

@interface HNPCommentCell ()

@property (weak, nonatomic) IBOutlet UILabel *PLCommentCountLable;
@property (weak, nonatomic) IBOutlet UIImageView *PLHead;
@property (weak, nonatomic) IBOutlet UILabel *PLNickName;
@property (weak, nonatomic) IBOutlet UILabel *PLPublisTime;
@property (weak, nonatomic) IBOutlet UILabel *PLNeirong;
@property (weak, nonatomic) IBOutlet UILabel *PLZanCount;


@end

@implementation HNPCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//+(instancetype)CommentCellXib
//{
//    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
//}

- (void)setPLModel:(HNPDynamicModle *)PLModel{
    
    self.PLCommentCountLable.text = [NSString stringWithFormat:@"%@ 评论",PLModel.commentCount];
    
    [self.PLHead sd_setImageWithURL:[NSURL URLWithString:PLModel.user.head] placeholderImage:[UIImage imageNamed:@"58261315FFCB0F03B1F6C11F9F2957ED"]];
    
    self.PLNickName.text = PLModel.user.nickName;
    self.PLPublisTime.text = PLModel.publishTime;
    self.PLNeirong.text = PLModel.user.signature;
    self.PLZanCount.text = PLModel.zanCount;
    
    
}


@end
