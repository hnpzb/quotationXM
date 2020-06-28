//
//  HNPUserCenterDetailsVC.m
//  quotainXM
//
//  Created by henanping on 2020/6/24.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPUserCenterDetailsVC.h"
#import "HNPUserCenterDetailsCell.h"

@interface HNPUserCenterDetailsVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableview;

@end

@implementation HNPUserCenterDetailsVC

static NSString *IDOne = @"UserCenterDetailsCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //在view中添加tableView
     _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:_tableview];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    
    
    [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPUserCenterDetailsCell class]) bundle:nil] forCellReuseIdentifier:IDOne];
       _tableview.estimatedRowHeight = 100;
       _tableview.rowHeight = UITableViewAutomaticDimension;
    
    //轻扫返回手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView)];
    [self.view addGestureRecognizer:swipe];
//    self.tableview.userInteractionEnabled = NO;
    
}

-(void)swipeView{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HNPUserCenterDetailsCell *UserCenterDetailsCell = [tableView dequeueReusableCellWithIdentifier:IDOne];
    UserCenterDetailsCell.Head = self.Head;
    UserCenterDetailsCell.nickname = self.nickname;
    UserCenterDetailsCell.UcDymamicModel = self.UserCenterDynamicDetailsModel;
    return UserCenterDetailsCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];        
}

@end
