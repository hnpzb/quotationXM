//
//  HNPDetailsCell.h
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/8.
//  Copyright © 2020 何南平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNPDynamicModle.h"

NS_ASSUME_NONNULL_BEGIN

@interface HNPDetailsCell : UITableViewCell

//定义模型属性接收数据
@property (nonatomic,strong)HNPDynamicModle *XQModle;

+(instancetype)DetailsCellXib;

@end

NS_ASSUME_NONNULL_END
