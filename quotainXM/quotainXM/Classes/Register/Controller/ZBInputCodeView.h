//
//  ZBInputCodeView.h
//  quotainXM
//
//  Created by 朱彬 on 2020/6/16.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//@class ZBInputCodeView;
//@protocol ZBInputCodeViewDelegate <NSObject>
//
//- (void)dynamicCellDidImageClick:(HNPDynamicCell *)DynamicCell;
//
//@end

@interface ZBInputCodeView : UIViewController

@property(nonatomic,copy)NSString *phone;
@property(nonatomic,assign)NSString *type;

@end

NS_ASSUME_NONNULL_END
