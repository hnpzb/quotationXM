//
//  ZBCalendarTableViewCell.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/6.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBCalendarTableViewCell.h"


@interface ZBCalendarTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *countryLabel;
@property (strong, nonatomic) IBOutlet UILabel *previousLabel;
@property (strong, nonatomic) IBOutlet UILabel *consensus;
@property (strong, nonatomic) IBOutlet UILabel *actualLabel;
@property (strong, nonatomic) IBOutlet UIImageView *xingxing_1;
@property (strong, nonatomic) IBOutlet UIImageView *xingxing_2;
@property (strong, nonatomic) IBOutlet UIImageView *xingxing_3;
@property (strong, nonatomic) IBOutlet UIImageView *xingxing_4;
@property (strong, nonatomic) IBOutlet UIImageView *xingxing_5;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ZBCalendarTableViewCell

- (void)setModel:(ZBCalendarModel *)model{
    _model = model;
    _nameLabel.text = model.name;
    _countryLabel.text = model.country;
    _previousLabel.text = model.previous;
    _consensus.text = model.consensus;
    _actualLabel.text = model.actual;
    _timeLabel.text =[self time_timestampToString:model.time.integerValue];
    
    switch (model.star.intValue) {
        case 0:
            break;
        case 1:
            _xingxing_1.image = [UIImage imageNamed:@"icon_xingxing-1"];
            break;
        case 2:
            _xingxing_1.image = [UIImage imageNamed:@"icon_xingxing-1"];
            _xingxing_2.image = [UIImage imageNamed:@"icon_xingxing-1"];
            break;
        case 3:
            _xingxing_1.image = [UIImage imageNamed:@"icon_xingxing-1"];
            _xingxing_2.image = [UIImage imageNamed:@"icon_xingxing-1"];
            _xingxing_3.image = [UIImage imageNamed:@"icon_xingxing-1"];
            break;
        case 4:
            _xingxing_1.image = [UIImage imageNamed:@"icon_xingxing-1"];
            _xingxing_2.image = [UIImage imageNamed:@"icon_xingxing-1"];
            _xingxing_3.image = [UIImage imageNamed:@"icon_xingxing-1"];
            _xingxing_4.image = [UIImage imageNamed:@"icon_xingxing-1"];
            break;
        case 5:
            _xingxing_1.image = [UIImage imageNamed:@"icon_xingxing-1"];
            _xingxing_2.image = [UIImage imageNamed:@"icon_xingxing-1"];
            _xingxing_3.image = [UIImage imageNamed:@"icon_xingxing-1"];
            _xingxing_4.image = [UIImage imageNamed:@"icon_xingxing-1"];
            _xingxing_5.image = [UIImage imageNamed:@"icon_xingxing-1"];
            break;
        default:
            break;
    }
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(NSString *)time_timestampToString:(NSInteger)timestamp{
    NSDate *conformTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//    [dateFormat setDateFormat:@"yyyy-MM-dd HH : mm"];
    [dateFormat setDateFormat:@"HH:mm"];
    NSString *string = [dateFormat stringFromDate:conformTimesp];
    return string;
}

@end
