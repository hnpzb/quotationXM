//
//  ZBColCellModel.h
//  quotainXM
//
//  Created by 朱彬 on 2020/6/17.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZBColCellModel : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *upOrDownPercent;

+(instancetype)ZBColCellModelWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
