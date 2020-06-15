//
//  HNPNewSletterCell.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/6.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPNewSletterCell.h"

@interface HNPNewSletterCell ()

@property (strong, nonatomic) IBOutlet UILabel *textLebel;


@end
@implementation HNPNewSletterCell

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//    self.textLebel.text = self.NewSletter.content;
//
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
    _textLebel.text = NewSletter.content;

    //此处进行拉xib线进行数据传递self.timeLable.text = NewSletter.timeLable;

}

@end
