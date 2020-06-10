//
//  ZBMainViewController.h
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/5.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"


NS_ASSUME_NONNULL_BEGIN


//@protocol ZBMainViewControllerDelegate <NSObject>
//
//@optional
//-(void)baiView:(UIView *)baiVC curBtnIndex:(NSInteger)curIndx preBtnIndex:(NSInteger)preBtnIndex;
//
//@end

@interface ZBMainViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *mainV;
@property(nonatomic,strong)UIView *baiVC;
//@property(nonatomic,weak)id<ZBMainViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
