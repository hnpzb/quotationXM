//
//  HNPLoginViewModel.m
//  quotainXM
//
//  Created by henanping on 2020/6/18.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPLoginViewModel.h"

@implementation HNPLoginViewModel

+(instancetype)LoginWithDict:(NSDictionary *)dict
{
    HNPLoginViewModel *LoginM = [[HNPLoginViewModel alloc]init];
    LoginM.nickName = dict[@"nickName"];
    LoginM.signature = dict[@"signature"];
    LoginM.fansCount = dict[@"fansCount"];
    LoginM.followCount = dict[@"followCount"];
    LoginM.talkCount = dict[@"talkCount"];
    LoginM.uuid = dict[@"uuid"];

    return LoginM;
}

@end
