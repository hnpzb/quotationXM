//
//  ZBHotNewsModel.m
//  quotainXM
//
//  Created by 朱彬 on 2020/6/18.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBHotNewsModel.h"
#import "ZBHotNewsUserModel.h"

@implementation ZBHotNewsModel

+(instancetype)ZBHotNewsModelWithDict:(NSDictionary *)dict{
    
    ZBHotNewsModel *model = [[ZBHotNewsModel alloc] init];
    model.browserCount = dict[@"browserCount"];
    model.commentCount = dict[@"commentCount"];
    model.content = dict[@"content"];
    model.picture = dict[@"picture"];
    model.zanCount = dict[@"zanCount"];
//    model.talkId = dict[@"id"];
    model.user = [ZBHotNewsUserModel ZBHotNewsUserModelWithDict:dict[@"user"]];
    return model;
    
}

@end
