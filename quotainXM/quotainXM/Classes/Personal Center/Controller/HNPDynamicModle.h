//
//  HNPDynamicModle.h
//  quotainXM
//
//  Created by henanping on 2020/6/12.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HNPDynamicUserModel;
@interface HNPDynamicModle : NSObject

@property (nonatomic ,strong)NSString *content;
@property (nonatomic ,strong)NSString *picture;
@property (nonatomic ,strong)NSString *publishTime;
@property (nonatomic ,retain)NSString *zanCount;
@property (nonatomic ,strong)NSString *commentCount;
@property (nonatomic ,strong)NSString *browserCount;
@property (nonatomic ,strong)NSString *forwardCount;
@property (nonatomic ,strong)HNPDynamicUserModel *user;

+(instancetype)DynamicWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
