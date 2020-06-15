//
//  HNPDynamicCell.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/6.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPDynamicCell.h"
#import "HNPDetailsVC.h"
#import "HNPDynamicModle.h"
#import "HNPDynamicUserModel.h"
#import <SDWebImage/SDWebImage.h>

@interface HNPDynamicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *DynamicImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *neirongLable;
@property (weak, nonatomic) IBOutlet UIImageView *neirongImageView;



@end

@implementation HNPDynamicCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.DynamicImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchImageView)];
    [self.DynamicImageView addGestureRecognizer:tapGes];

}

-(void)touchImageView
{
    if ([self.delegate respondsToSelector:@selector(dynamicCellDidImageClick:)]) {
        [self.delegate dynamicCellDidImageClick:self];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)DynamicXib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setDTModel:(HNPDynamicModle *)DTModel{
    _DTModel = DTModel;
    
    [self.DynamicImageView sd_setImageWithURL:[NSURL URLWithString:DTModel.user.head] placeholderImage:[UIImage imageNamed:@"58261315FFCB0F03B1F6C11F9F2957ED"]];
    self.neirongLable.text = DTModel.content;
    self.nickName.text = DTModel.user.nickName;
    [self.neirongImageView sd_setImageWithURL:[NSURL URLWithString:DTModel.picture] placeholderImage:[UIImage imageNamed:@"58261315FFCB0F03B1F6C11F9F2957ED"]];
    
    
}

@end
