//
//  HNPNewSletterModle.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/6.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPNewSletterModle.h"

@implementation HNPNewSletterModle

+(instancetype)NewSletterModleWithDict:(NSDictionary *)dict
{
    HNPNewSletterModle *modle = [[HNPNewSletterModle alloc]init];
    modle.timeLable = dict[@"tameLable"];
    modle.newsLablel = dict[@"newsLablel"];
    modle.nameLable = dict[@"nameLable"];
    return modle;
}

@end
