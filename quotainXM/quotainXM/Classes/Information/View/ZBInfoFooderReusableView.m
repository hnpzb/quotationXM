//
//  ZBInfoFooderReusableView.m
//  quotationAPP
//
//  Created by HFY on 2020/6/7.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBInfoFooderReusableView.h"

@implementation ZBInfoFooderReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
/*
-(void)addImageView:(NSInteger)i{
        CGFloat margin = 5;
    CGFloat imageViewW = self.frame.size.width / 3 - 20;
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"pic_bg_%ld",i]];
        imageView.frame = CGRectMake(margin + ( margin + imageViewW) * (i - 1) ,margin, imageViewW, 54);
        [self addLabelOne:imageView];
        [self addLabelTwo:imageView];
        [self addSubview:imageView];
}

-(void)addLabelOne:(UIView *)view{
       UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(10,10,75.5,13.5);
        label.numberOfLines = 1;
        [view addSubview:label];

        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"每日动态" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];

        label.attributedText = string;
}
-(void)addLabelTwo:(UIView *)view{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10,30,59.5,9.5);
    label.numberOfLines = 1;
    [view addSubview:label];

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"精彩不断" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 10],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:208/255.0 blue:213/255.0 alpha:1.0]}];

    label.attributedText = string;
}
 */
 
@end
