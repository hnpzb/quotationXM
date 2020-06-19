//
//  ZBSignInModel.h
//  quotainXM
//
//  Created by 朱彬 on 2020/6/19.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZBSignInModel : NSObject

@property(nonatomic,copy)NSString *continueTimes;
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *time;

+(instancetype)ZBSignInModelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
