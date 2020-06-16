//
//  HNPNewSletterModle.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/6.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPNewSletterModle.h"
#import <sys/utsname.h>

@implementation HNPNewSletterModle

+(instancetype)NewSletterModleWithDict:(NSDictionary *)dict
{
    HNPNewSletterModle *modle = [[HNPNewSletterModle alloc]init];
//    modle.timeLable = dict[@"tameLable"];
//    modle.newsLablel = dict[@"newsLablel"];
//    modle.nameLable = dict[@"nameLable"];
    modle.content = dict[@"content"];
    modle.time = [HNPNewSletterModle time_timestampToString:[dict[@"time"] integerValue]];
    modle.yearMD = [HNPNewSletterModle timetampTostring:[dict[@"time"] longValue]];
    modle.day = [HNPNewSletterModle getDayWithTime:modle.yearMD];
    return modle;
}

+(NSString *)time_timestampToString:(NSInteger)timestamp{
    NSDate *conformTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//    [dateFormat setDateFormat:@"yyyy-MM-dd HH : mm"];
    [dateFormat setDateFormat:@"HH:mm"];
    NSString *string = [dateFormat stringFromDate:conformTimesp];
    return string;
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

+(NSString *)getDayWithTime:(NSString *)timeStr{
    NSArray *array1 =[timeStr componentsSeparatedByString:@"-"];
    return array1.lastObject;
}
@end
