//
//  HNPDynamicUserModel.h
//  quotainXM
//
//  Created by henanping on 2020/6/12.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HNPDynamicUserModel : NSObject

@property (nonatomic ,strong)NSString *head;
@property (nonatomic ,strong)NSString *nickName;

+(instancetype)DynamicUserWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
