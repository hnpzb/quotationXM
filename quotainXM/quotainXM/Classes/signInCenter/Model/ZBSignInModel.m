//
//  ZBSignInModel.m
//  quotainXM
//
//  Created by 朱彬 on 2020/6/19.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBSignInModel.h"

@implementation ZBSignInModel

+(instancetype)ZBSignInModelWithDict:(NSDictionary *)dict{
    
    ZBSignInModel *model = [[ZBSignInModel alloc] init];
    
    model.continueTimes = dict[@"continueTimes"];
    model.time = dict[@"time"];
    model.userId = dict[@"userId"];
    
    return model;
}

@end
