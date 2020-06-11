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

@interface HNPDetailsVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HNPDetailsVC

static NSString *IDOne = @"DetailsCellID";
static NSString *IDTwo = @"CommentCellID";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //在view中添加tableView
    
    UIView *vc = [[UIView alloc] init];
    vc.backgroundColor = [UIColor whiteColor];
    vc.frame = CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, 60);
    
    UIButton *btn_back = [[UIButton alloc] init];
    
    btn_back.frame = CGRectMake(10.5,20,20,20);
    [btn_back setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [vc addSubview:btn_back];
    [btn_back addTarget:self action:@selector(breakDeatail:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn_gd = [[UIButton alloc] init];
    btn_gd.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 30,20,10,20);
    [btn_gd setImage:[UIImage imageNamed:@"gengduo2"] forState:UIControlStateNormal];
    [vc addSubview:btn_gd];
    
    [self.view addSubview:vc];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height ) style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    tableview.dataSource = self;
    tableview.delegate = self;
    
    [tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPDetailsCell class]) bundle:nil] forCellReuseIdentifier:IDOne];
    [tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPCommentCell class]) bundle:nil] forCellReuseIdentifier:IDTwo];
    tableview.estimatedRowHeight = 100;
    tableview.rowHeight = UITableViewAutomaticDimension;
    
    
}
-(void)breakDeatail:(UIButton *)btn{
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    [self.navigationController popViewControllerAnimated:YES];
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
        return 5;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        HNPDetailsCell *DetailsCell = [tableView dequeueReusableCellWithIdentifier:IDOne];
        //cell的选中样式
        DetailsCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return DetailsCell;
    } else {
        HNPCommentCell *DynamicCell = [tableView dequeueReusableCellWithIdentifier:IDTwo];
        DynamicCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return DynamicCell;
    }
}


@end
