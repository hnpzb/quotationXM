//
//  HNPDynamicUserModel.m
//  quotainXM
//
//  Created by henanping on 2020/6/12.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPDynamicUserModel.h"

@implementation HNPDynamicUserModel

+(instancetype)DynamicUserWithDict:(NSDictionary *)dict
{
    HNPDynamicUserModel *DynamicUserM = [[HNPDynamicUserModel alloc]init];
    DynamicUserM.head = dict[@"head"];
    DynamicUserM.nickName = dict[@"nickName"];
    DynamicUserM.signature = dict[@"signature"];
    
    return DynamicUserM;
}

@end
