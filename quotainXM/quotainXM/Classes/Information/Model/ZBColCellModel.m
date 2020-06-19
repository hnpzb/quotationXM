//
//  ZBColCellModel.m
//  quotainXM
//
//  Created by 朱彬 on 2020/6/17.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBColCellModel.h"

@implementation ZBColCellModel

+(instancetype)ZBColCellModelWithDict:(NSDictionary *)dict{
    ZBColCellModel *model = [[ZBColCellModel alloc] init];
    model.name = dict[@"name"];
    model.price = dict[@"price"];
    model.upOrDownPercent = dict[@"upOrDownPercent"];
    
    return model;
}

@end
