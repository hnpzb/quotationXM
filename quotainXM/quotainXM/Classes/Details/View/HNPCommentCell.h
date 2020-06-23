//
//  HNPCommentCell.h
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/8.
//  Copyright © 2020 何南平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNPDynamicModle.h"
#import "talkListModel.h"

NS_ASSUME_NONNULL_BEGIN

@class ListModel;
@interface HNPCommentCell : UITableViewCell

@property (nonatomic ,strong)ListModel *PLModel;

+(instancetype)CommentCellXib;

@end

NS_ASSUME_NONNULL_END
