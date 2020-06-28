//
//  ZBHotNewsUserModel.m
//  quotainXM
//
//  Created by 朱彬 on 2020/6/18.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBHotNewsUserModel.h"

@implementation ZBHotNewsUserModel

+(instancetype)ZBHotNewsUserModelWithDict:(NSDictionary *)dict{
    ZBHotNewsUserModel *model = [[ZBHotNewsUserModel alloc] init];
    model.head = dict[@"head"];
    model.nickName = dict[@"nickName"];
//    model.signature =dict[@"signature"];
    return model;
}

@end
