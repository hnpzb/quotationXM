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




@interface ZBMainViewController : UIViewController

//xib的view
@property (strong, nonatomic) IBOutlet UIView *mainV;
//自定义的view
@property(nonatomic,strong)UIView *baiVC;

//@property(nonatomic,weak)id<ZBMainViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
