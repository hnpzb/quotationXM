//
//  ZBIndustryTableViewCell.h
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/6.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBIndustryMode.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZBIndustryTableViewCell : UITableViewCell

@property(nonatomic,strong)ZBIndustryMode *industryModel;

/** 返回cell的高度 */
- (CGFloat)cellHeight;

@end

NS_ASSUME_NONNULL_END
