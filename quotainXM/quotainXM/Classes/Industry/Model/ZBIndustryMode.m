//
//  ZBIndustryMode.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/6.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBIndustryMode.h"
#import <sys/utsname.h>

@implementation ZBIndustryMode

+(instancetype)ZBIndustryModeWithDict:(NSDictionary *)dict{
    ZBIndustryMode *mode = [[ZBIndustryMode alloc] init];
    mode.content = dict[@"content"];
    mode.timer =[ZBIndustryMode timetampTostring:[dict[@"time"] longValue]];
//    mode.timer = dict[@" "];
//    mode.timer = dict[@" "];
    return mode;
    
}

+(NSString *)timetampTostring:(long)timestamp{
    
    NSString *tempTime =[[NSNumber numberWithLong:timestamp] stringValue];
    NSMutableString *getTime = [NSMutableString stringWithFormat:@"%@",tempTime];

      //    NSMutableString *getTime = @"1461896616000";
     struct utsname systemInfo;
     uname(&systemInfo);

     [getTime deleteCharactersInRange:NSMakeRange(10,3)];
     NSDateFormatter *matter = [[NSDateFormatter alloc]init];
//    matter.dateFormat =@"YYYY-MM-dd HH:mm";
    matter.dateFormat =@"YYYY-MM-dd";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[getTime intValue]];

      NSString *timeStr = [matter stringFromDate:date];
//    NSArray *array1 =[timeStr componentsSeparatedByString:@"-"];

    return timeStr;
}

@end
