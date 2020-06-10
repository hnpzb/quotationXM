//
//  ZBQuotationModal.h
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/6.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZBQuotationModal : NSObject

@property(nonatomic,copy)NSString *contractName;
@property(nonatomic,copy)NSString *priceNew;
@property(nonatomic,copy)NSString *dataChange;
@property(nonatomic,copy)NSString *volume;

+(instancetype)quotationModalWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
