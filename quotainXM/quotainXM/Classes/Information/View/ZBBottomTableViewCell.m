//
//  ZBBottomTableViewCell.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/8.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBBottomTableViewCell.h"
#import <SDWebImage/SDWebImage.h>

@interface ZBBottomTableViewCell ()

//@property(nonatomic,strong)UIImageView *image_View;
@property (strong, nonatomic) IBOutlet UIImageView *image_View;

//@property(nonatomic,strong)UILabel *label;

@property (strong, nonatomic) IBOutlet UILabel *label;
//@property(nonatomic,strong)UILabel *label_one;
@property (strong, nonatomic) IBOutlet UILabel *label_one;

//@property(nonatomic,strong)UILabel *label_two;
@property (strong, nonatomic) IBOutlet UILabel *label_two;

//@property(nonatomic,strong)UILabel *label_three;
@property (strong, nonatomic) IBOutlet UILabel *label_three;

//@property(nonatomic,strong)UILabel *label_four;
@property (strong, nonatomic) IBOutlet UILabel *label_four;

//@property(nonatomic,strong)UIImageView *image_icon;
@property (strong, nonatomic) IBOutlet UIImageView *image_icon;


@end

@implementation ZBBottomTableViewCell

- (void)setModel:(ZBHotNewsModel *)model{
    _model = model;
    [_image_View sd_setImageWithURL:[NSURL URLWithString:model.picture]];
    _label.text = model.content;
    _label_one.text = [NSString stringWithFormat:@"%@万观看",model.browserCount];
    _label_two.text = [NSString stringWithFormat:@"%@赞",model.zanCount];
    _label_three.text = [NSString stringWithFormat:@"%@评论",model.commentCount];
    _label_four.text = model.user.nickName;
    [_image_icon sd_setImageWithURL:[NSURL URLWithString:model.user.head]];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
    //
    _image_View.image = [UIImage imageNamed:@"pic_bg_1"];
//    _image_View.frame = CGRectMake(15,15,132,99);
    _image_View.layer.cornerRadius = 4;
    _image_View.clipsToBounds = YES;
    
//    _label.frame = CGRectMake(159,15,190,54.5);
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"在中国，月入多少才算是高端人群?" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 16],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];

    _label.attributedText = string;
    
    //
//    _label_one.frame = CGRectMake(159,70,48,10.5);
    NSMutableAttributedString *string_one = [[NSMutableAttributedString alloc] initWithString:@"2.1万观看" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 11],NSForegroundColorAttributeName: [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0]}];
    _label_one.attributedText = string_one;
    
    //
//    _label_two.frame = CGRectMake(214,70,24.5,10.5);
    _label_two.numberOfLines = 0;
    NSMutableAttributedString *string_two = [[NSMutableAttributedString alloc] initWithString:@"99赞" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 11],NSForegroundColorAttributeName: [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0]}];
    _label_two.attributedText = string_two;
    
    //
//    _label_three.frame = CGRectMake(241,70,35,10.5);
    _label_three.numberOfLines = 0;
    NSMutableAttributedString *string_three = [[NSMutableAttributedString alloc] initWithString:@"12评论" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 11],NSForegroundColorAttributeName: [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0]}];
    _label_three.attributedText = string_three;
    
//    _image_icon.frame = CGRectMake(159,94,20,20);
    _image_icon.image = [UIImage imageNamed:@"pic_bg_1"];
    _image_icon.layer.cornerRadius = 10;
    _image_icon.clipsToBounds = YES;
    
    //
//    _label_four.frame = CGRectMake(185,100,90,11);
    NSMutableAttributedString *string_four = [[NSMutableAttributedString alloc] initWithString:@"Alan海七" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
    _label_four.attributedText = string_four;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
