//
//  ZBDiscoverMainVC.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/9.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBDiscoverMainVC.h"
#import "HNPDiscoveryViewC.h"
#import "HNPPushCell.h"
#import "HNPDynamicCell.h"
#import "ZBFollowViewController.h"
#import "ZBNavigationController.h"

#import "HNPDetailsVC.h"

@interface ZBDiscoverMainVC ()
@property (strong, nonatomic) IBOutlet UIView *mainV;

@property(nonatomic,strong)UIView *baiVC;
@property(nonatomic,strong)UIButton *preSelectBtn;

@end

@implementation ZBDiscoverMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addChildVC];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(baiChange:) name:@"jump" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showbai:) name:@"back" object:nil];
    
}
-(void)baiChange:(NSNotification *)notice{
    self.baiVC.hidden = YES;
}

-(void)showbai:(NSNotification *)notice{
    self.baiVC.hidden = NO;
}
-(void)addChildVC{
    
    NSArray *childClassName = @[@"HNPDiscoveryViewC",
                                @"ZBFollowViewController"];
    for (NSString *className in childClassName) {
        UIViewController *vc = [[NSClassFromString(className) alloc] init];
        ZBNavigationController *nav = [[ZBNavigationController alloc] initWithRootViewController:vc];
        nav.navigationBar.hidden = YES;
        [self addChildViewController:nav];
    }
    
    ZBNavigationController *vc = self.childViewControllers[0];

    vc.view.frame = self.view.bounds;

    [self addTopView:vc.view];

    [self.mainV addSubview:vc.view];
    
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)addTopView:(UIView *)view{
    
//    UITapGestureRecognizer *top = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuClick:)];

    CGFloat vc_W_old = view.frame.size.width;
    CGFloat vc_w_new = vc_W_old;
    
    self.baiVC = [[UIView alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, vc_w_new, 44)];
//    self.baiVC.backgroundColor = [UIColor clearColor];
    
    UIButton *btn_if = [[UIButton alloc] init];
    [self.baiVC addSubview:btn_if];
    btn_if.frame = CGRectMake(0, 0, vc_w_new * 0.2, 44);
    btn_if.tag = 1000 + 0;
    [self setWithBtn:btn_if name:@"发现"];
    btn_if.selected = YES;
    btn_if.subviews.firstObject.hidden = NO;
    self.preSelectBtn = btn_if;
    
    [btn_if addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn_ns = [[UIButton alloc] init];
    [self.baiVC addSubview:btn_ns];
    btn_ns.frame = CGRectMake(vc_w_new * 0.2 *1.0, 0, vc_w_new * 0.2, 44);
    btn_ns.tag = 1000 + 1;
     [self setWithBtn:btn_ns name:@"关注"];
    [btn_ns addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    
      UIButton *sosuo = [[UIButton alloc] init];

    [self.baiVC addSubview:sosuo];
    sosuo.frame = CGRectMake(vc_w_new * 0.2 * 4.0 + 40, 10 ,15, 15);
    [sosuo setBackgroundImage:[UIImage imageNamed:@"icon_souso "] forState:UIControlStateNormal];
    
    [view addSubview:self.baiVC];
    
    
    
    
}

-(void)setWithBtn:(UIButton *)btn name:(NSString *)name {
    btn.backgroundColor = [UIColor clearColor];
    NSMutableAttributedString *string_n = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0]}];
    [btn setAttributedTitle:string_n forState:UIControlStateNormal];
    
    NSMutableAttributedString *string_s = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 20],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
    [btn setAttributedTitle:string_s forState:UIControlStateSelected];
    
    UIView *blankBarView = [[UIView alloc] init];
    blankBarView.backgroundColor = [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0];
    blankBarView.layer.cornerRadius = 1.5;
    [btn addSubview:blankBarView];
    blankBarView.bounds = CGRectMake(0, 0, 12, 3);
    blankBarView.center = CGPointMake(40, 38);
    blankBarView.hidden = YES;
}

-(void)menuClick:(UIButton *)btn{
    //调用代理方法
    

    UIView *view_cur = btn.subviews.firstObject;
    view_cur.hidden = !(view_cur.hidden);
    
    UIView *view_pre = self.preSelectBtn.subviews.firstObject;
    view_pre.hidden = !(view_pre.hidden);
    //1.取消上一个选中状态
    self.preSelectBtn.selected = NO;
    //2.当前点击的按钮成为选中状态
    btn.selected = YES;
    //3.当前点击的按钮成为上一个选中状态按钮
    self.preSelectBtn = btn;
    
    UIViewController *preVC = self.childViewControllers[self.preSelectBtn.tag - 1000];
    [preVC.view removeFromSuperview];

    UIViewController *curVC = self.childViewControllers[btn.tag - 1000];
    
    curVC.view.frame = self.view.bounds;
    [curVC.view addSubview:self.baiVC];
    [self.mainV addSubview:curVC.view];
}



@end
