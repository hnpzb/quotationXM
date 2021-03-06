//
//  ZBMainViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/5.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBMainViewController.h"

#import "ZBInformationViewController.h"
#import "ZBIndustryViewController.h"
#import "ZBQuotationViewController.h"
#import "ZBCalendarViewController.h"
#import "HNPNewsletterViewController.h"
#import "ZBNavigationController.h"
#import "CZ_NEWMarketVC.h"
@interface ZBMainViewController ()

@property(nonatomic,strong)UIButton *preSelectBtn;

//@property(nonatomic,assign)CGRect *temp;
@property(nonatomic,assign)CGFloat vc_X;
@property(nonatomic,assign)CGFloat vc_Y;
@property(nonatomic,assign)CGFloat vc_W_old;
@property(nonatomic,assign)CGFloat vc_H;
@property(nonatomic,assign)CGFloat vc_W_new;

@end

@implementation ZBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildVC];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(baiChange:) name:@"enterNext" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showbai:) name:@"backPre" object:nil];
}
- (void)viewDidAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}

-(void)baiChange:(NSNotification *)notice{
    self.baiVC.hidden = YES;
}

-(void)showbai:(NSNotification *)notice{
    self.baiVC.hidden = NO;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)addChildVC{
    
    NSArray *childClassName = @[@"ZBInformationViewController",
                                @"HNPNewsletterViewController",
                                @"CZ_NEWMarketVC",
                                 @"ZBIndustryViewController",
                                @"ZBCalendarViewController"];
    for (NSString *className in childClassName) {
        UIViewController *vc = [[NSClassFromString(className) alloc] init];
         ZBNavigationController *nav = [[ZBNavigationController alloc] initWithRootViewController:vc];
        nav.navigationBar.hidden = YES;
        //添加控制器
        [self addChildViewController:nav];
    }

    UIViewController *vc = self.childViewControllers[0];
    CGRect temp = self.mainV.bounds;
    vc.view.frame =temp;
    [self addTopView:vc.view];
    [self.mainV addSubview:vc.view];
    
    
}
-(void)addTopView:(UIView *)view{
    
    CGFloat vc_X = view.frame.origin.x;
    CGFloat vc_Y = view.frame.origin.y;
    CGFloat vc_W_old = [UIScreen mainScreen].bounds.size.width;
    CGFloat vc_H = view.frame.size.height;
    CGFloat vc_w_new = vc_W_old;
    self.vc_X = vc_X;
    self.vc_Y = vc_Y;
    self.vc_W_old = vc_W_old;
    self.vc_H = vc_H;
    self.vc_W_new = vc_w_new;
    
    self.baiVC.backgroundColor = [UIColor whiteColor];
    self.baiVC = [[UIView alloc] initWithFrame:CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height, vc_w_new, 44)];

    
    UIButton *btn_if = [[UIButton alloc] init];
    [self.baiVC addSubview:btn_if];
    btn_if.frame = CGRectMake(0, 0, vc_w_new * 0.2, 44);
    btn_if.tag = 1000 + 0;
    [self setWithBtn:btn_if name:@"资讯"];
    btn_if.selected = YES;
    btn_if.subviews.firstObject.hidden = NO;
    self.preSelectBtn = btn_if;
    
    [btn_if addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn_ns = [[UIButton alloc] init];
    [self.baiVC addSubview:btn_ns];
    btn_ns.frame = CGRectMake(vc_w_new * 0.2 *1.0, 0, vc_w_new * 0.2, 44);
    btn_ns.tag = 1000 + 1;
     [self setWithBtn:btn_ns name:@"时讯"];
    [btn_ns addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn_qa = [[UIButton alloc] init];
    [self.baiVC addSubview:btn_qa];
    btn_qa.frame = CGRectMake(vc_w_new * 0.2 * 2.0, 0, vc_w_new * 0.2, 44);
    btn_qa.tag = 1000 + 2;
     [self setWithBtn:btn_qa name:@"行情"];
    [btn_qa addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn_Indu = [[UIButton alloc] init];
    [self.baiVC addSubview:btn_Indu];
    btn_Indu.frame = CGRectMake(vc_w_new * 0.2 * 3.0, 0, vc_w_new * 0.2, 44);
    btn_Indu.tag = 1000 + 3;
    [self setWithBtn:btn_Indu name:@"行业"];
    [btn_Indu addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //日历按钮
    UIButton *btn_calend = [[UIButton alloc] init];
    [self.baiVC addSubview:btn_calend];
    btn_calend.frame = CGRectMake(vc_w_new * 0.2 * 4.0, 0, vc_w_new * 0.2, 44);
    btn_calend.tag = 1000 + 4;
    [self setWithBtn:btn_calend name:@"日历"];
    [btn_calend addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:self.baiVC];
    
    
    
    
}

-(void)setWithBtn:(UIButton *)btn name:(NSString *)name {
    btn.backgroundColor = [UIColor clearColor];
    //按钮正常状态
    NSMutableAttributedString *string_n = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0]}];
    [btn setAttributedTitle:string_n forState:UIControlStateNormal];
    //按钮选中状态
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
    

    [self.childViewControllers[self.preSelectBtn.tag - 1000].view removeFromSuperview];
 
//    UIViewController *curVC = self.childViewControllers[btn.tag - 1000];
    [self.childViewControllers[btn.tag - 1000].view addSubview:self.baiVC];
    [self.mainV addSubview:self.childViewControllers[btn.tag - 1000].view];//
}


@end
