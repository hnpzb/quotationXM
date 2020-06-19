//
//  ZBPersonModel.m
//  quotainXM
//
//  Created by 朱彬 on 2020/6/18.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBPersonModel.h"

@implementation ZBPersonModel

+(instancetype)ZBPersonModelWithDict:(NSDictionary *)dict{
    
    ZBPersonModel *model = [[ZBPersonModel alloc] init];
    
    model.fansCount = dict[@"fansCount"];
    model.followCount = dict[@"followCount"];
    model.head = dict[@"head"];
    model.nickName = dict[@"nickName"];
    model.signature = dict[@"signature"];
    model.talkCount = dict[@"talkCount"];
    model.userId = dict[@"id"];
    
    return model;
    
}

@end
