//
//  HNPNewSletterModle.h
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/6.
//  Copyright © 2020 何南平. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HNPNewSletterModle : NSObject

/**
 新闻时间
 */
@property (nonatomic ,copy)NSNumber *timeLable;

/**
 新闻内容
 */
@property (nonatomic ,copy)NSString *newsLablel;

/**
 新闻发送者
 */
@property (nonatomic ,copy)NSString *nameLable;

+(instancetype)NewSletterModleWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
