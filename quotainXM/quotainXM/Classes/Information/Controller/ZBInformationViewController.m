//
//  ZBInformationViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/6.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBInformationViewController.h"
#import "ZBInfoCollectionViewCell.h"
#import "ZBInfoHeaderReusableView.h"
#import "ZBInfoFooderReusableView.h"
#import "ZBTopTableViewCell.h"
#import "ZBBottomTableViewCell.h"
#import "ZBMineViewController.h"
#import "ZBInfoCollectionView.h"
#import <AFNetworking.h>
#import "ZBHotNewsModel.h"
#import "ZBSignInViewController.h"
#import "ZBloginViewController.h"
#import "HNPDetailsVC.h"
#import "HNPDynamicModle.h"
#import "HNPDynamicUserModel.h"


@interface ZBInformationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign)NSInteger heightconst;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)NSMutableArray *tempArray;

@property(nonatomic,strong)ZBPersonModel *mineUserInfoModel;

@end

@implementation ZBInformationViewController

static NSString *top_ID = @"TopTableViewCell";
static NSString *bot_ID = @"BottomTableViewCell";
static NSString *ID = @"InfoCollectionCell";
static NSString *header_ID = @"InfoHeaderReusableView";
static NSString *fooder_ID = @"InfoFooderReusableView";

- (NSMutableArray *)tempArray{
    if (_tempArray == nil) {
        _tempArray = [NSMutableArray array];
    }
    return _tempArray;
}

- (NSMutableArray *)array{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}


- (void)viewWillAppear:(BOOL)animated{
    [self reLoadHotnews];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self determineWhetherToLogin];
        //设置tableView
            CGRect tabTemp = CGRectMake(0, 44+[[UIApplication sharedApplication] statusBarFrame].size.height,[[UIApplication sharedApplication] statusBarFrame].size.width,self.view.frame.size.height - 44 - [[UIApplication sharedApplication] statusBarFrame].size.height - 49);
        
        if (@available(iOS 13.0, *)) {
                      
                      self.tableView = [[UITableView alloc] initWithFrame:tabTemp style:UITableViewStylePlain];
                      
                  } else {
                       self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44+[[UIApplication sharedApplication] statusBarFrame].size.height,[[UIApplication sharedApplication] statusBarFrame].size.width,self.view.frame.size.height - [[UIApplication sharedApplication] statusBarFrame].size.height - 235) style:UITableViewStyleGrouped];
                     self.tableView.contentInset  = UIEdgeInsetsMake(-75,0, 0, 0);
                  }
    
    self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self.view addSubview:self.tableView];
    
    
        //设置上半部分的view
        ZBInfoCollectionView *view = [[ZBInfoCollectionView alloc] initWithW:self.tableView.frame.size.width];
        view.backgroundColor = [UIColor whiteColor];
        self.tableView.tableHeaderView = view;
        self.tableView.tableHeaderView.frame = CGRectMake(0, 0, 0, 500);
            
        [self.tableView registerNib:[UINib nibWithNibName:@"ZBTopTableViewCell" bundle:nil] forCellReuseIdentifier:top_ID];
        [self.tableView registerNib:[UINib nibWithNibName:@"ZBBottomTableViewCell" bundle:nil] forCellReuseIdentifier:bot_ID];
    

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(informationSignIn) name:@"informationSignIn" object:nil];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];

}

-(void)refresh
{
     [self reLoadHotnews];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self.tableView.mj_header endRefreshing];
       });
}
-(void)loadMore
{
    [self reLoadHotnews];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self.tableView.mj_footer endRefreshing];
       });
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)informationSignIn{
    [self determineWhetherToLogin];
    if (self.login == YES) {

        [[NSNotificationCenter defaultCenter] postNotificationName:@"enterNext" object:self];
        ZBSignInViewController *signInVC = [[ZBSignInViewController alloc] init];
        signInVC.userID = self.mineUserInfoModel.userId;
        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController:signInVC animated:YES];
    }else{
        ZBloginViewController *loginVC = [[ZBloginViewController alloc] init];
        loginVC.loginType = YES;
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"enterNext" object:self];
//        [self.navigationController pushViewController:loginVC animated:YES];
        [self presentViewController:loginVC animated:YES completion:nil];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"icon_hot"];
    imageView.frame = CGRectMake(20, 20, 13, 15);
    [view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(40,20,61.5,14.5);
    label.numberOfLines = 0;
    [view addSubview:label];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"热点资讯" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
    label.attributedText = string;
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

        return 44;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

        ZBBottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:bot_ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = _array[indexPath.row];
        return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    HNPDetailsVC *vc = [[HNPDetailsVC alloc] init];
    HNPDynamicModle *dymodel = self.tempArray[indexPath.row];
    vc.dynamicModle = dymodel;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"enterNext" object:self];
    self.tabBarController.tabBar.hidden = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)reLoadHotnews{
    
    NSURL *url = [NSURL URLWithString:@"http://api.yysc.online/user/talk/getTalkListByProject?project=futures&pageNumber&pageSize"];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSArray *dataArray = dict[@"data"][@"list"];
        NSMutableArray *temp = [NSMutableArray array];
        NSMutableArray *temp_two = [NSMutableArray array];
        for (NSDictionary *dict in dataArray) {
            ZBHotNewsModel *model = [ZBHotNewsModel ZBHotNewsModelWithDict:dict];
            HNPDynamicModle *dyModel = [HNPDynamicModle DynamicWithDict:dict];
            [temp addObject:model];
            [temp_two addObject:dyModel];
            
        }
        self.array = temp;
        self.tempArray = temp_two;
        dispatch_async(dispatch_get_main_queue(), ^{
           [self.tableView reloadData];
        });
    }]resume];
}

#pragma mark - 判断是否登录
/**判断是否登录*/
- (void)determineWhetherToLogin
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/user.plist"];
//    NSString *path =[[NSBundle mainBundle] pathForResource:@"user.plist" ofType:nil];

    self.mineUserInfoModel = [ZBPersonModel mj_objectWithFile:path];
    if (self.mineUserInfoModel == nil) {
        self.login = NO;
    } else {
        self.login = YES;
    }
}

@end
