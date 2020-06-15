//
//  ZBIndustryMode.h
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/6.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZBIndustryMode : NSObject

//@property(nonatomic,copy)NSString *timer;
@property(nonatomic,copy)NSString *content;
//@property(nonatomic,copy)NSString *classtag;

+(instancetype)ZBIndustryModeWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
