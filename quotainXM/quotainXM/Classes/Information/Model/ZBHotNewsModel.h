//
//  ZBHotNewsModel.h
//  quotainXM
//
//  Created by 朱彬 on 2020/6/18.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZBHotNewsUserModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface ZBHotNewsModel : NSObject

@property(nonatomic,copy)NSString *picture;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *browserCount;
@property(nonatomic,copy)NSString *zanCount;
@property(nonatomic,copy)NSString *commentCount;
//@property (nonatomic ,strong)NSString *talkId;
@property(nonatomic,strong)ZBHotNewsUserModel *user;

+(instancetype)ZBHotNewsModelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
