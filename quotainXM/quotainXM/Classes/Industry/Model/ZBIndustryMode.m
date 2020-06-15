//
//  ZBIndustryMode.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/6.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBIndustryMode.h"

@implementation ZBIndustryMode

+(instancetype)ZBIndustryModeWithDict:(NSDictionary *)dict{
    ZBIndustryMode *mode = [[ZBIndustryMode alloc] init];
    mode.content = dict[@"content"];
//    mode.timer = dict[@" "];
//    mode.timer = dict[@" "];
//    mode.timer = dict[@" "];
    return mode;
    
}

@end
