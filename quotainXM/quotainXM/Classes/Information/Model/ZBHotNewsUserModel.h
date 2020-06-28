//
//  ZBHotNewsUserModel.h
//  quotainXM
//
//  Created by 朱彬 on 2020/6/18.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZBHotNewsUserModel : NSObject

@property(nonatomic,copy)NSString *head;
@property(nonatomic,copy)NSString *nickName;
//@property (nonatomic ,strong)NSString *signature;

+(instancetype)ZBHotNewsUserModelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
