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
//@property (nonatomic ,copy)NSString *content;

/**
 新闻内容
 */
@property (nonatomic ,copy)NSString *content;

/**
 新闻发送者
 */
//@property (nonatomic ,copy)NSString *author;

+(instancetype)NewSletterModleWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
