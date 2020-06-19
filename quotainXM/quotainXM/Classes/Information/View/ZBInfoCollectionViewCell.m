//
//  ZBInfoCollectionViewCell.m
//  quotationAPP
//
//  Created by HFY on 2020/6/7.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBInfoCollectionViewCell.h"

@interface ZBInfoCollectionViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *upOrDownPercentLabel;


@end

@implementation ZBInfoCollectionViewCell

- (void)setModel:(ZBColCellModel *)model{
    _model = model;
    _nameLabel.text = model.name;
    _priceLabel.text = model.price;
    _priceLabel.text = model.upOrDownPercent;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

@end
