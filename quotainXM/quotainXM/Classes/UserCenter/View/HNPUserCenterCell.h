//
//  HNPUserCenterCell.h
//  quotainXM
//
//  Created by henanping on 2020/6/15.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNPDynamicModle.h"
#import "HNPDynamicCell.h"

NS_ASSUME_NONNULL_BEGIN

@class HNPUserCenterCell;
@protocol HNPUserCenterCellDelegate <NSObject>

- (void)userCenterCellDidFollowBtnClick:(HNPUserCenterCell *)cell;

@end

@interface HNPUserCenterCell : UITableViewCell

@property (nonatomic ,weak) id<HNPUserCenterCellDelegate> delegate;

@property (nonatomic ,strong)HNPDynamicModle *UserCModle;

@property (weak, nonatomic) IBOutlet UIButton *UserQXFollowBtn;

@property (weak, nonatomic) IBOutlet UILabel *UserQXGZLable;

@property (weak, nonatomic) IBOutlet UIImageView *UserFollowBtn;





@end

NS_ASSUME_NONNULL_END
