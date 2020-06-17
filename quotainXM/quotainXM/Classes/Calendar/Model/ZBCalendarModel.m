//
//  ZBCalendarModel.m
//  quotainXM
//
//  Created by 朱彬 on 2020/6/16.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBCalendarModel.h"

@implementation ZBCalendarModel

+(instancetype)ZBCalendarModelWithDict:(NSDictionary *)dict{
    ZBCalendarModel *model = [[ZBCalendarModel alloc] init];
    model.actual = dict[@"actual"];
    model.consensus = dict[@"consensus"];
    model.country = dict[@"country"];
    model.name = dict[@"name"];
    model.previous = dict[@"previous"];
    model.star = dict[@"star"];
    model.time = dict[@"time"];
    return model;
}

@end
