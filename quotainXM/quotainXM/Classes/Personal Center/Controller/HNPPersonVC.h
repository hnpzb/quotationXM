//
//  HNPPersonVC.h
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/8.
//  Copyright © 2020 何南平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNPDynamicModle.h"
#import "HNPDynamicUserModel.h"
#import "ZBPersonModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HNPPersonVC : UIViewController

@property (nonatomic ,strong)HNPDynamicModle *PersonM;
@property(nonatomic,strong)ZBPersonModel *model;
@property(nonatomic,assign)Boolean login;

@end

NS_ASSUME_NONNULL_END
