//
//  ZBPersonModel.h
//  quotainXM
//
//  Created by 朱彬 on 2020/6/18.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZBPersonModel : NSObject

@property(nonatomic,copy)NSString *head;
@property(nonatomic,copy)NSString *nickName;
@property(nonatomic,copy)NSString *signature;
@property(nonatomic,copy)NSString *fansCount;
@property(nonatomic,copy)NSString *followCount;
@property(nonatomic,copy)NSString *talkCount;
@property(nonatomic,copy)NSString *userId;

+(instancetype)ZBPersonModelWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
