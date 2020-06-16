//
//  HNPNewSletterHerderView.m
//  quotainXM
//
//  Created by henanping on 2020/6/10.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPNewSletterHerderView.h"

@interface HNPNewSletterHerderView ()

@property(nonatomic,strong)UILabel *lableData;
@property(nonatomic,strong)UILabel *label;

@end

@implementation HNPNewSletterHerderView

- (void)setModel:(HNPNewSletterModle *)model{
    _lableData.text = model.day;
    _label.text = model.yearMD;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //头部日历图片
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"icon_rili"];
        imageView.frame = CGRectMake(15, 10, 25, 25);
        [self addSubview:imageView];
        //头部数字
        _lableData = [[UILabel alloc] init];
        _lableData.frame = CGRectMake(20.5,19,15,10);
        _lableData.numberOfLines = 0;
        [self addSubview:_lableData];
        
        NSMutableAttributedString *lableNumber = [[NSMutableAttributedString alloc] initWithString:@"27" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
        _lableData.attributedText = lableNumber;
//        lableData.text = _model.day;
        
        //头部日期
        _label = [[UILabel alloc] init];
        _label.frame = CGRectMake(53,13,120.5,14);
        _label.numberOfLines = 0;
        [self addSubview:_label];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"今天" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
        _label.attributedText = string;
//        label.text = _model.yearMD;
        
    }
    return self;
}

@end
