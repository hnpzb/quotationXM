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

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *country;
@property(nonatomic,strong)NSString *previous;//前值
@property(nonatomic,strong)NSString *consensus;//预期
@property(nonatomic,strong)NSString *actual;//公布
@property(nonatomic,assign)NSInteger *star;

@end

NS_ASSUME_NONNULL_END
