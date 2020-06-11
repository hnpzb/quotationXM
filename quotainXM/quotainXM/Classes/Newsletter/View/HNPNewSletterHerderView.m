//
//  HNPNewSletterHerderView.m
//  quotainXM
//
//  Created by henanping on 2020/6/10.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPNewSletterHerderView.h"

@implementation HNPNewSletterHerderView

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
        UILabel *lableData = [[UILabel alloc] init];
        lableData.frame = CGRectMake(20.5,19,15,10);
        lableData.numberOfLines = 0;
        [self addSubview:lableData];
        
        NSMutableAttributedString *lableNumber = [[NSMutableAttributedString alloc] initWithString:@"27" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
        lableData.attributedText = lableNumber;
        
        //头部日期
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(53,13,31.5,14);
        label.numberOfLines = 0;
        [self addSubview:label];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"今天" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
        label.attributedText = string;
        
    }
    return self;
}

@end
