//
//  ZBIndustryTableViewCell.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/6.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBIndustryTableViewCell.h"

@interface ZBIndustryTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *timerLabel;

@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UILabel *tagLabel;

@end

@implementation ZBIndustryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setIndustryModel:(ZBIndustryMode *)industryModel{
    _industryModel = industryModel;
//    self.timerLabel.text = industryModel.timer;
    self.contentLabel.text = industryModel.content;
//    self.tagLabel.text = industryModel.classtag;
    
    
}

- (CGFloat)cellHeight
{
    // 强制刷新(目的:让label根据显示的文字计算自己的宽度和高度)
    [self layoutIfNeeded];
    
    return CGRectGetMaxY(self.tagLabel.frame)+10;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
