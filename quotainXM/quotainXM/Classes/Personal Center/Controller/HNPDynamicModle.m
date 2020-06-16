//
//  HNPDynamicModle.m
//  quotainXM
//
//  Created by henanping on 2020/6/12.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPDynamicModle.h"
#import "HNPDynamicUserModel.h"
#import <sys/utsname.h>

@implementation HNPDynamicModle

+(instancetype)DynamicWithDict:(NSDictionary *)dict
{
    HNPDynamicModle *DynamicM = [[HNPDynamicModle alloc]init];
    DynamicM.content = dict[@"content"];
    DynamicM.picture = dict[@"picture"];
    DynamicM.publishTime = [HNPDynamicModle timetampTostring:[dict[@"publishTime"] longValue]];
    DynamicM.zanCount = [dict[@"zanCount"] stringValue];
    DynamicM.commentCount = [dict[@"commentCount"] stringValue];
    DynamicM.browserCount = [dict[@"browserCount"] stringValue];
    if ([dict.allKeys containsObject:@"user"]) {
        if ([(NSDictionary *)dict[@"user"]allKeys].count > 0) {
            HNPDynamicUserModel *users = [HNPDynamicUserModel DynamicUserWithDict:dict[@"user"]];
            DynamicM.user = users;
        }
    }
    
    return DynamicM;
}
//时间戳
+(NSString *)timetampTostring:(long)timestamp{
    
    NSString *tempTime =[[NSNumber numberWithLong:timestamp] stringValue];
    NSMutableString *getTime = [NSMutableString stringWithFormat:@"%@",tempTime];

      //    NSMutableString *getTime = @"1461896616000";
     struct utsname systemInfo;
     uname(&systemInfo);

     [getTime deleteCharactersInRange:NSMakeRange(10,3)];
     NSDateFormatter *matter = [[NSDateFormatter alloc]init];
//    matter.dateFormat =@"YYYY-MM-dd HH:mm";
    matter.dateFormat = @"YYYY-MM-dd";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[getTime intValue]];

      NSString *timeStr = [matter stringFromDate:date];
//    NSArray *array1 =[timeStr componentsSeparatedByString:@"-"];

    return timeStr;
}

+(NSString *)time_timestampToString:(NSInteger)timestamp{
    NSDate *conformTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//    [dateFormat setDateFormat:@"yyyy-MM-dd HH : mm"];
    [dateFormat setDateFormat:@"HH:mm"];
    NSString *string = [dateFormat stringFromDate:conformTimesp];
    return string;
}

@end
