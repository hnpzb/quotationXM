//
//  ZBCalendarModel.h
//  quotainXM
//
//  Created by 朱彬 on 2020/6/16.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZBCalendarModel : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *country;
@property(nonatomic,copy)NSString *previous;//前值
@property(nonatomic,copy)NSString *consensus;//预期
@property(nonatomic,copy)NSString *actual;//公布
@property(nonatomic,copy)NSString *star;
@property(nonatomic,copy)NSString *time;

+(instancetype)ZBCalendarModelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
