//
//  ZBQuotationModal.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/6.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBQuotationModal.h"

@implementation ZBQuotationModal

+(instancetype)quotationModalWithDict:(NSDictionary *)dict{
    ZBQuotationModal *modal = [[ZBQuotationModal alloc] init];
    modal.name = dict[@"name"];
    modal.price = dict[@"price"];
    modal.upPercent = dict[@"upPercent"];
    modal.dealCount = dict[@"dealCount"];
    return modal;
}

@end
