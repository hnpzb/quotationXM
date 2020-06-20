//
//  HNPUserCenterVC.m
//  quotainXM
//
//  Created by henanping on 2020/6/15.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPUserCenterVC.h"
#import "HNPUserCenterCell.h"
#import "HNPDynamicCell.h"


@interface HNPUserCenterVC ()<UITableViewDelegate,UITableViewDataSource,HNPUserCenterCellDelegate>

@property(nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)NSArray *UserArray;

@end

@implementation HNPUserCenterVC

static NSString *IDOne = @"UserCenterCellID";
static NSString *IDTwo = @"DynamicCellID";

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //在view中添加tableView
//    [UIApplication sharedApplication].statusBarFrame.size.height
     _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 44) style:UITableViewStylePlain];
    [self.view addSubview:_tableview];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    
    
    [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPUserCenterCell class]) bundle:nil] forCellReuseIdentifier:IDOne];
       [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPDynamicCell class]) bundle:nil] forCellReuseIdentifier:IDTwo];
       _tableview.estimatedRowHeight = 100;
       _tableview.rowHeight = UITableViewAutomaticDimension;
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView)];
    [self.view addGestureRecognizer:swipe];
    
}

-(void)swipeView{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        HNPUserCenterCell *centerCell = [tableView dequeueReusableCellWithIdentifier:IDOne];
        centerCell.selectionStyle = UITableViewCellSelectionStyleNone;
        centerCell.UserCModle = _UserCenterModle;
        centerCell.delegate = self;
            return centerCell;
        } else {
            HNPDynamicCell *DynamicCell = [tableView dequeueReusableCellWithIdentifier:IDTwo];
            DynamicCell.selectionStyle = UITableViewCellSelectionStyleNone;
            DynamicCell.followBtn.hidden = YES;
            return DynamicCell;
        }
}

- (void)userCenterCellDidFollowBtnClick:(HNPUserCenterCell *)cell{
    
    cell.UserQXFollowBtn.selected = !cell.UserQXFollowBtn.selected;
            if (cell.UserQXFollowBtn.selected) {
                cell.UserQXGZLable.text = @"点击关注";
                cell.UserQXFollowBtn.backgroundColor = [UIColor greenColor];
            }else{
                cell.UserQXGZLable.text = @"取消关注";
                cell.UserQXFollowBtn.backgroundColor = [UIColor whiteColor];
            }
}


@end

//打印输出cell的行号与地址
//            NSLog(@"%zd-%p",indexPath.row,centerCell);
