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
    modal.contractName = dict[@"contract"];
    modal.priceNew = dict[@"price"];
    modal.dataChange = dict[@"dataChang"];
    modal.volume = dict[@"volume"];
    return modal;
}

@end
