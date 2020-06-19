//
//  ZBDayCell.m
//  日历自写尝试
//
//  Created by 朱彬 on 2020/6/19.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBDayCell.h"

@interface ZBDayCell ()

@property (strong, nonatomic) IBOutlet UILabel *dayL;


@end

@implementation ZBDayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _dayL.layer.cornerRadius = dayCellH / 2;
    _dayL.clipsToBounds = YES;
}

//MARK: - setmethod

- (void)setCellDate:(NSDate *)cellDate {
    _cellDate = cellDate;
    if (_type == CalendarType_Week) {
        [self showDateFunction];
    } else {
        if ([[YXDateHelpObject manager] checkSameMonth:_cellDate AnotherMonth:_currentDate]) {
            [self showDateFunction];
        } else {
            [self showSpaceFunction];
        }
    }
    
}

//MARK: - otherMethod

- (void)showSpaceFunction {
    self.userInteractionEnabled = NO;
    _dayL.text = @"";
    _dayL.backgroundColor = [UIColor clearColor];
    _dayL.layer.borderWidth = 0;
    _dayL.layer.borderColor = [UIColor clearColor].CGColor;
}

- (void)showDateFunction {
    
    self.userInteractionEnabled = YES;
    
    _dayL.text = [[YXDateHelpObject manager] getStrFromDateFormat:@"d" Date:_cellDate];
    if ([[YXDateHelpObject manager] isSameDate:_cellDate AnotherDate:[NSDate date]]) {
        _dayL.layer.borderWidth = 1.5;
        _dayL.layer.borderColor = [UIColor whiteColor].CGColor;
    } else {
        _dayL.layer.borderWidth = 0;
        _dayL.layer.borderColor = [UIColor clearColor].CGColor;
    }
    if (_selectDate) {
        //修改选中状态下的cell属性
        if ([[YXDateHelpObject manager] isSameDate:_cellDate AnotherDate:_selectDate]) {
            _dayL.backgroundColor = [UIColor whiteColor];
            _dayL.textColor = [UIColor redColor];
            _dayL.layer.cornerRadius =  dayCellH / 2;
        } else {
            _dayL.backgroundColor = [UIColor clearColor];
            _dayL.textColor = [UIColor whiteColor];
        }
        
    }
    NSString *currentDate = [[YXDateHelpObject manager] getStrFromDateFormat:@"MM-dd" Date:_cellDate];
    if (_eventArray.count) {
        for (NSString *strDate in _eventArray) {
            if ([strDate isEqualToString:currentDate]) {
            }
        }
    }
    
}


@end
