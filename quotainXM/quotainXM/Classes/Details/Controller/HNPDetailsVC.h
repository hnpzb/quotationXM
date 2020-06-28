//
//  HNPDetailsVC.h
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/8.
//  Copyright © 2020 何南平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNPDynamicModle.h"
#import "talkListModel.h"
#import "ZBHotNewsModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface HNPDetailsVC : UIViewController

@property(nonatomic,strong)HNPDynamicModle *dynamicModle;
@property(nonatomic,assign)Boolean login;
//@property(nonatomic,strong)ZBHotNewsModel *HotNewsModle;


@end

NS_ASSUME_NONNULL_END
