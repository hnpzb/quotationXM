//
//  HNPUserCenterDetailsCell.h
//  quotainXM
//
//  Created by henanping on 2020/6/24.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNPDynamicModle.h"
#import "userModel.h"
#import "talkListModel.h"

NS_ASSUME_NONNULL_BEGIN

@class ListModel;
@interface HNPUserCenterDetailsCell : UITableViewCell


@property (nonatomic ,strong)ListModel *UcDymamicModel;
@property (nonatomic,strong)NSString *Head;
@property (nonatomic,strong)NSString *nickname;


@end

NS_ASSUME_NONNULL_END
