//
//  HNPDetailsVC.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/8.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPDetailsVC.h"
#import "HNPDetailsCell.h"
#import "HNPCommentCell.h"
#import "ZBDiscoverMainVC.h"
#import "HNPDynamicModle.h"
@interface HNPDetailsVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation HNPDetailsVC

static NSString *IDOne = @"DetailsCellID";
static NSString *IDTwo = @"CommentCellID";

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    //在view中添加tableView
    

    [self creatTopView];
    [self creatTableView];
    
    //轻扫返回上个界面手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView)];
    [self.view addGestureRecognizer:swipe];
//    NSLog(@"%@",_dynamicModle.publishTime);
    
}

//轻扫返回
-(void)swipeView{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 创建一个顶部View来进行控制器的切换
 */
- (void)creatTopView{
    //顶部点击图标切换控制器的view
       UIView *vc = [[UIView alloc] init];
       vc.backgroundColor = [UIColor whiteColor];
       vc.frame = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, [UIScreen mainScreen].bounds.size.width, 44);
       
       //创建返回按钮
       UIButton *btn_back = [[UIButton alloc] init];
       btn_back.frame = CGRectMake(10.5,20,20,20);
       [btn_back setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
       [vc addSubview:btn_back];
       //监听按钮的返回
       [btn_back addTarget:self action:@selector(breakDeatail:) forControlEvents:UIControlEventTouchUpInside];
       
       //创建更多按钮
       UIButton *btn_gd = [[UIButton alloc] init];
       btn_gd.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 30,20,10,20);
       [btn_gd setImage:[UIImage imageNamed:@"gengduo2"] forState:UIControlStateNormal];
       [vc addSubview:btn_gd];
       
       [self.view addSubview:vc];
}

/**
 在view中添加tableView
 */
- (void)creatTableView{
    //在view中添加tableView
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - ([UIApplication sharedApplication].statusBarFrame.size.height + 44) ) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    //注册xib
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HNPDetailsCell class]) bundle:nil] forCellReuseIdentifier:IDOne];
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HNPCommentCell class]) bundle:nil] forCellReuseIdentifier:IDTwo];
    
    //tableViewCell自适应高度
    _tableView.estimatedRowHeight = 100;
    _tableView.rowHeight = UITableViewAutomaticDimension;
}

/**
 点击返回按钮进行跳转
 */
-(void)breakDeatail:(UIButton *)btn
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 10;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        HNPDetailsCell *DetailsCell = [tableView dequeueReusableCellWithIdentifier:IDOne];
        //cell的选中样式
        DetailsCell.selectionStyle = UITableViewCellSelectionStyleNone;
        DetailsCell.XQModle = _dynamicModle;
        return DetailsCell;
    } else {
        HNPCommentCell *CommentCell = [tableView dequeueReusableCellWithIdentifier:IDTwo];
        CommentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        CommentCell.PLModel = _dynamicModle;
        return CommentCell;
    }
}




@end
