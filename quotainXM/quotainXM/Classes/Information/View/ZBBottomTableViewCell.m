//
//  ZBBottomTableViewCell.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/8.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBBottomTableViewCell.h"

@implementation ZBBottomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"pic_bg_1"];
    imageView.frame = CGRectMake(15,15,132,99);
    [self addSubview:imageView];
    
   UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(159,15,190,54.5);
    label.numberOfLines = 0;
    [self addSubview:label];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"在中国，月入多少才算是高端人群?" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 16],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
//    [string addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 16]} range:NSMakeRange(0, 18)];

    label.attributedText = string;
    

    UILabel *label_one = [[UILabel alloc] init];
    label_one.frame = CGRectMake(159,70,48,10.5);
    label_one.numberOfLines = 0;
    [self addSubview:label_one];
    NSMutableAttributedString *string_one = [[NSMutableAttributedString alloc] initWithString:@"2.1万观看" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 11],NSForegroundColorAttributeName: [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0]}];
    label_one.attributedText = string_one;
    
       
    UILabel *label_two = [[UILabel alloc] init];
    label_two.frame = CGRectMake(214,70,24.5,10.5);
    label_two.numberOfLines = 0;
    [self addSubview:label_two];
    NSMutableAttributedString *string_two = [[NSMutableAttributedString alloc] initWithString:@"99赞" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 11],NSForegroundColorAttributeName: [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0]}];
    label_two.attributedText = string_two;
    
    UILabel *label_three = [[UILabel alloc] init];
    label_three.frame = CGRectMake(241,70,35,10.5);
    label_three.numberOfLines = 0;
    [self addSubview:label_three];
    NSMutableAttributedString *string_three = [[NSMutableAttributedString alloc] initWithString:@"12评论" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 11],NSForegroundColorAttributeName: [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0]}];
    label_three.attributedText = string_three;
    
    UIImageView *imageView_icon = [[UIImageView alloc] init];
    imageView_icon.frame = CGRectMake(159,94,20,20);
    imageView_icon.image = [UIImage imageNamed:@"pic_bg_1"];
    [self addSubview:imageView_icon];
    
    UILabel *label_four = [[UILabel alloc] init];
    label_four.frame = CGRectMake(185,100,49.5,11);
    label.numberOfLines = 0;
    [self addSubview:label_four];
    NSMutableAttributedString *string_four = [[NSMutableAttributedString alloc] initWithString:@"Alan海七" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
    label_four.attributedText = string_four;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
