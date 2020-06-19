//
//  ZBMonthView.h
//  日历自写尝试
//
//  Created by 朱彬 on 2020/6/19.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBDayCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^SendSelectDate)(NSDate *selDate);

@interface ZBMonthView : UIView

@property (nonatomic, strong) NSDate *currentDate;          //当前月份
@property (nonatomic, strong) NSDate *selectDate;           //选中日期
@property (nonatomic, copy) SendSelectDate sendSelectDate;  //回传选中日期
@property (nonatomic, assign) CalendarType type;            //日历模式
@property (nonatomic, strong) NSArray *eventArray;          //事件数组

- (instancetype)initWithFrame:(CGRect)frame Date:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
