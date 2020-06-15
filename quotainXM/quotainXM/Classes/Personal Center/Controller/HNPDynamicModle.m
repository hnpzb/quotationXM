//
//  HNPDynamicModle.m
//  quotainXM
//
//  Created by henanping on 2020/6/12.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPDynamicModle.h"
#import "HNPDynamicUserModel.h"

@implementation HNPDynamicModle

+(instancetype)DynamicWithDict:(NSDictionary *)dict
{
    HNPDynamicModle *DynamicM = [[HNPDynamicModle alloc]init];
    DynamicM.content = dict[@"content"];
    DynamicM.picture = dict[@"picture"];
    if ([dict.allKeys containsObject:@"user"]) {
        if ([(NSDictionary *)dict[@"user"]allKeys].count > 0) {
            HNPDynamicUserModel *users = [HNPDynamicUserModel DynamicUserWithDict:dict[@"user"]];
            DynamicM.user = users;
        }
    }
    
    return DynamicM;
}


@end
