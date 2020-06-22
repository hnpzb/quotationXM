//
//  HNPDynamicCell.h
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/6.
//  Copyright © 2020 何南平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "talkListModel.h"
#import "userModel.h"

@class HNPDynamicCell,HNPDynamicModle,HNPFollowModel,HNPUserCenterModel;
@protocol HNPDynamicCellDelegate <NSObject>

- (void)dynamicCellDidImageClick:(HNPDynamicCell *)DynamicCell;

@end



@interface HNPDynamicCell : UITableViewCell

@property (nonatomic ,weak) id<HNPDynamicCellDelegate> delegate;

//定义模型属性接收数据(发现)
@property (nonatomic,strong)HNPDynamicModle *DTModel;
//定义模型属性接收数据(关注)
@property (nonatomic,strong)HNPFollowModel *FollowModel;
//定义用户中心模型属性
@property (nonatomic ,strong)ListModel *UserDynamicModle;

@property (weak, nonatomic) IBOutlet UIImageView *followBtn;

@property (nonatomic ,strong)HNPDynamicModle *allDynamicModel;


//快速加载动态xib
+(instancetype)DynamicXib;


@end

