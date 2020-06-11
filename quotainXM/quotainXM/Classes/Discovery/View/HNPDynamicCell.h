//
//  HNPDynamicCell.h
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/6.
//  Copyright © 2020 何南平. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HNPDynamicCell;
@protocol HNPDynamicCellDelegate <NSObject>

- (void)dynamicCellDidImageClick:(HNPDynamicCell *)DynamicCell;

@end

@interface HNPDynamicCell : UITableViewCell



//动态
+(instancetype)DynamicXib;

@property (nonatomic ,weak) id<HNPDynamicCellDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
