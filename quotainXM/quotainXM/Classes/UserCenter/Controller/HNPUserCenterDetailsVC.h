//
//  HNPUserCenterDetailsVC.h
//  quotainXM
//
//  Created by henanping on 2020/6/24.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNPDynamicModle.h"

NS_ASSUME_NONNULL_BEGIN

@class ListModel;
@interface HNPUserCenterDetailsVC : UIViewController

@property (nonatomic ,strong)ListModel *UserCenterDynamicDetailsModel;

@property (nonatomic,strong)NSString *Head;
@property (nonatomic,strong)NSString *nickname;


@end

NS_ASSUME_NONNULL_END
