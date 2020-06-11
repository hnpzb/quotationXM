//
//  HNPDynamicCell.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/6.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPDynamicCell.h"
#import "HNPDetailsVC.h"

@interface HNPDynamicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *DynamicImageView;


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

+(instancetype)DynamicXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}



@end
