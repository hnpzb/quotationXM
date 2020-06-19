//
//  HNPDynamicCell.h
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/6.
//  Copyright © 2020 何南平. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HNPDynamicCell,HNPDynamicModle,HNPFollowModel;
@protocol HNPDynamicCellDelegate <NSObject>

- (void)dynamicCellDidImageClick:(HNPDynamicCell *)DynamicCell;

@end



@interface HNPDynamicCell : UITableViewCell

@property (nonatomic ,weak) id<HNPDynamicCellDelegate> delegate;

//定义模型属性接收数据(发现)
@property (nonatomic,strong)HNPDynamicModle *DTModel;
//定义模型属性接收数据(关注)
@property (nonatomic,strong)HNPFollowModel *FollowModel;

@property (weak, nonatomic) IBOutlet UIImageView *followBtn;


//快速加载动态xib
+(instancetype)DynamicXib;


@end

