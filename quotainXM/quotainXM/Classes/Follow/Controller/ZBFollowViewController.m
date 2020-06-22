//
//  ZBFollowViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/9.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBFollowViewController.h"
#import "HNPPushCell.h"
#import "HNPDynamicCell.h"
#import <AFNetworking.h>
#import "HNPFabuVC.h"
#import "HNPFollowModel.h"
#import <MJExtension/MJExtension.h>
#import "HNPFollowModel.h"

@interface ZBFollowViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)HNPFollowModel *FollowM;
@property(nonatomic,strong)NSArray *FollowArray;

@end

@implementation ZBFollowViewController

static NSString *IDOne = @"PushCellID";
static NSString *IDTwo = @"DynamicCellID";

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self FollowJSON];
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - ([UIApplication sharedApplication].statusBarFrame.size.height)) style:UITableViewStylePlain];

    [self.view addSubview:_tableview];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    
    _tableview.estimatedRowHeight = 80;
    _tableview.rowHeight = UITableViewAutomaticDimension;

    [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPPushCell class]) bundle:nil] forCellReuseIdentifier:IDOne];
    [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPDynamicCell class]) bundle:nil] forCellReuseIdentifier:IDTwo];
    
}


/**
 加载关注界面网络数据
 */
- (void)FollowJSON{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.yysc.online/user/talk/getRecommandTalk" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable result) {
        
        
        NSMutableArray *tempArray = [NSMutableArray new];
        tempArray = [HNPFollowModel mj_objectArrayWithKeyValuesArray:result[@"data"][@"list"]];
        self.FollowArray = tempArray;
        [self.tableview reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.FollowArray.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     if (indexPath.section == 0) {
                HNPPushCell *pushCell = [tableView dequeueReusableCellWithIdentifier:IDOne];
                return pushCell;
            } else {
                HNPDynamicCell *DynamicCell = [tableView dequeueReusableCellWithIdentifier:IDTwo];
                DynamicCell.FollowModel = self.FollowArray[indexPath.row];
                //NSLog(@"%zd-%p",indexPath.row,DynamicCell);
                return DynamicCell;
            }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"jump" object:self];
        HNPFabuVC *fabuVC = [[HNPFabuVC alloc]init];
//        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController:fabuVC animated:YES];
        
    }else{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
        
    }
    
}

@end
