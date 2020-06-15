//
//  HNPDiscoveryViewC.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/8.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPDiscoveryViewC.h"
#import "HNPPushCell.h"
#import "HNPDynamicCell.h"
#import "ZBFollowViewController.h"
#import "HNPDetailsVC.h"

@interface HNPDiscoveryViewC ()<UITableViewDelegate,UITableViewDataSource,HNPDynamicCellDelegate>

@property(nonatomic,strong)UIView *baiVC;
@property(nonatomic,strong)UIButton *preSelectBtn;

@property (strong, nonatomic) IBOutlet UIView *mainV;
@property(nonatomic,strong)UITableView *tableview;
@end

@implementation HNPDiscoveryViewC

static NSString *IDOne = @"PushCellID";
static NSString *IDTwo = @"DynamicCellID";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //在view中添加tableView
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];

    [self.view addSubview:_tableview];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    
    [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPPushCell class]) bundle:nil] forCellReuseIdentifier:IDOne];
    [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPDynamicCell class]) bundle:nil] forCellReuseIdentifier:IDTwo];
    self.baiVC.backgroundColor = [UIColor whiteColor];
    _tableview.estimatedRowHeight = 100;
    _tableview.rowHeight = UITableViewAutomaticDimension;

    
}

-(void)addChildVC{
    
    NSArray *childClassName = @[@"HNPDiscoveryViewC",
                                @"ZBFollowViewController"];
    for (NSString *className in childClassName) {
        UIViewController *vc = [[NSClassFromString(className) alloc] init];
        [self addChildViewController:vc];
    }
    
    UIViewController *vc = self.childViewControllers[0];

    [self addChildViewController:vc];

    [self addTopView:vc.view];

    [self.mainV addSubview:vc.view];
    
    
}

-(void)addTopView:(UIView *)view{
    
    CGFloat vc_X = view.frame.origin.x;
    CGFloat vc_Y = view.frame.origin.y;
    CGFloat vc_W_old = view.frame.size.width;
    CGFloat vc_H = view.frame.size.height;
    CGFloat vc_w_new = vc_W_old;
    
    CGRect temp = CGRectMake(vc_X, vc_Y , vc_w_new, vc_H );
    self.baiVC = [[UIView alloc] initWithFrame:CGRectMake(0, 40, vc_w_new, 44)];
    
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
    
    
    [view addSubview:self.baiVC];
    
    view.frame = temp;
    
    
    
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
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //通过判断加载两个xib
    if (indexPath.section == 0) {
            HNPPushCell *pushCell = [tableView dequeueReusableCellWithIdentifier:IDOne];
            //cell的选中样式
            pushCell.selectionStyle = UITableViewCellSelectionStyleNone;
            //NSLog(@"%zd-%p",indexPath.row,pushCell);
            return pushCell;
        } else {
            HNPDynamicCell *DynamicCell = [tableView dequeueReusableCellWithIdentifier:IDTwo];
            DynamicCell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            DynamicCell.delegate = self;
            return DynamicCell;
        }
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//}


//自定义一个代理进行跳转
-(void)dynamicCellDidImageClick:(HNPDynamicCell *)DynamicCell
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"jump" object:self];  //此处有位置问题
    HNPDetailsVC *VC = [[HNPDetailsVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}


@end
