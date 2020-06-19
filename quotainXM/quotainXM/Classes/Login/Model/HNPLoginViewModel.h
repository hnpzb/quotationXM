//
//  HNPLoginViewModel.h
//  quotainXM
//
//  Created by henanping on 2020/6/18.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HNPLoginViewModel : NSObject

@property (nonatomic ,copy)NSString *nickName;
@property (nonatomic ,copy)NSString *signature;
@property (nonatomic ,copy)NSString *fansCount;
@property (nonatomic ,copy)NSString *followCount;
@property (nonatomic ,copy)NSString *talkCount;
@property (nonatomic ,copy)NSString *uuid;

+(instancetype)LoginWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
