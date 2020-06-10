//
//  ZBNewSletterHeaderView.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/8.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBNewSletterHeaderView.h"

@implementation ZBNewSletterHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"icon_rili"];
        imageView.frame = CGRectMake(15, 10, 25, 25);
        [self addSubview:imageView];
        
        UILabel *label_one = [[UILabel alloc] init];
        label_one.frame = CGRectMake(20.5,19,15,10);
        label_one.numberOfLines = 0;
        [self addSubview:label_one];
        NSMutableAttributedString *string_one = [[NSMutableAttributedString alloc] initWithString:@"27" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
        label_one.attributedText = string_one;
        
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
