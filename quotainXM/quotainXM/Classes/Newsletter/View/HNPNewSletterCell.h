//
//  HNPNewSletterCell.h
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/6.
//  Copyright © 2020 何南平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNPNewSletterModle.h"

NS_ASSUME_NONNULL_BEGIN

@interface HNPNewSletterCell : UITableViewCell

@property (nonatomic ,strong)HNPNewSletterModle *NewSletter;

+ (instancetype)NewSletterXib;

@end

NS_ASSUME_NONNULL_END
