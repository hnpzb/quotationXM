//
//  ZBBottomTableViewCell.h
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/8.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBHotNewsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZBBottomTableViewCell : UITableViewCell

@property(nonatomic,strong)ZBHotNewsModel *model;

@end

NS_ASSUME_NONNULL_END
