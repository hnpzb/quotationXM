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
#import <AFNetworking.h>
#import "HNPUserCenterModel.h"
#import <MJExtension/MJExtension.h>
#import "talkListModel.h"
#import "HNPDynamicModle.h"


@interface HNPUserCenterVC ()<UITableViewDelegate,UITableViewDataSource,HNPUserCenterCellDelegate>

@property(nonatomic,strong)UITableView *tableview;

@property(strong, nonatomic)talkListModel *userArray;



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
     _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 44) style:UITableViewStylePlain];
    [self.view addSubview:_tableview];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    
    //加载用户中心动态数据
    [self UserCenterJson];
    
    [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPUserCenterCell class]) bundle:nil] forCellReuseIdentifier:IDOne];
       [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPDynamicCell class]) bundle:nil] forCellReuseIdentifier:IDTwo];
       _tableview.estimatedRowHeight = 100;
       _tableview.rowHeight = UITableViewAutomaticDimension;
    
    //轻扫返回手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView)];
    [self.view addGestureRecognizer:swipe];
    
    self.tableview.contentInset  = UIEdgeInsetsMake(-25,0, 0, 0);
    
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
        return self.userArray.list.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HNPUserCenterCell *centerCell = [tableView dequeueReusableCellWithIdentifier:IDOne];
        centerCell.selectionStyle = UITableViewCellSelectionStyleNone;
        centerCell.UserCModle = self.UserCenterModle;
        centerCell.delegate = self;
            return centerCell;
        } else {
            HNPDynamicCell *DynamicCell = [tableView dequeueReusableCellWithIdentifier:IDTwo];
            DynamicCell.selectionStyle = UITableViewCellSelectionStyleNone;
            DynamicCell.followBtn.hidden = YES;
            //拿到用户的头像
            DynamicCell.allDynamicModel = self.UserDynamicM;
            //拿到每一组的数据
            DynamicCell.UserDynamicModle = self.userArray.list[indexPath.row];
            return DynamicCell;
        }
}


-(void)UserCenterJson{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.yysc.online"] sessionConfiguration:configuration];
        
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        AFJSONResponseSerializer *response   = [AFJSONResponseSerializer serializer];
        response.removesKeysWithNullValues = YES;
        response.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/html",@"text/css",@"text/javascript", nil];
    //    manager.responseSerializer = response;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"Referer"];
    
        // 设置超时时间
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = 20.f;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    //根据userId加载用户中心的动态数据
    NSMutableDictionary *dict_m = [NSMutableDictionary new];
    [dict_m setObject:@"publishTime" forKey:@"_orderByDesc"];
    [dict_m setObject:self.UserCenterModle.userId forKey:@"userId"];
    
    [manager POST:@"/user/talk/getTalkList/0" parameters:dict_m headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable result) {

        self.userArray = [talkListModel mj_objectWithKeyValues:result[@"data"]];
        [self.tableview reloadData];

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        }];
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


