//
//  HNPNewSletterCell.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/6.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPNewSletterCell.h"


@implementation HNPNewSletterCell

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

+ (instancetype)NewSletterXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] [0];
}

-(void)setNewSletter:(HNPNewSletterModle *)NewSletter
{
    _NewSletter = NewSletter;
    //此处进行拉xib线进行数据传递self.timeLable.text = NewSletter.timeLable;
}

@end
