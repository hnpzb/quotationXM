//
//  HNPUserCenterModel.h
//  quotainXM
//
//  Created by henanping on 2020/6/20.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HNPUserCenteruserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HNPUserCenterModel : NSObject

@property (nonatomic ,strong)NSString *content;
@property (nonatomic ,strong)NSString *picture;
@property (nonatomic ,strong)NSString *zanCount;
@property (nonatomic ,strong)NSString *commentCount;

@property (nonatomic ,strong)HNPUserCenteruserModel *user;

@end

NS_ASSUME_NONNULL_END
