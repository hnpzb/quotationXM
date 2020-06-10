//
//  ZBTopTableViewCell.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/8.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBTopTableViewCell.h"
#import "ZBInfoCollectionView.h"

@implementation ZBTopTableViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
    // Initialization code
//    ZBInfoCollectionView *view = [[ZBInfoCollectionView alloc] initWithW:[UIScreen mainScreen].bounds.size.width];
////    ZBInfoCollectionView *view = [[NSBundle mainBundle] loadNibNamed:@"ZBInfoCollectionView" owner:nil options:nil].lastObject;
//    [self addSubview:view];
//    ZBInfoCollectionView *view = [[ZBInfoCollectionView alloc] initWithW:[UIScreen mainScreen].bounds.size.width];
//           //    ZBInfoCollectionView *view = [[NSBundle mainBundle] loadNibNamed:@"ZBInfoCollectionView" owner:nil options:nil].lastObject;
//               [self addSubview:view];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
