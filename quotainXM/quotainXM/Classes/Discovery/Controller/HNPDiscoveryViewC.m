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
#import "HNPDynamicModle.h"
#import "HNPPersonVC.h"
#import "HNPUserCenterVC.h"
#import "HNPFabuVC.h"
#import <AFNetworking.h>
#import <MJExtension/MJExtension.h>

@interface HNPDiscoveryViewC ()<UITableViewDelegate,UITableViewDataSource,HNPDynamicCellDelegate>

@property(nonatomic,strong)UIView *baiVC;
//上一个选中的按钮
@property(nonatomic,strong)UIButton *preSelectBtn;

@property (strong, nonatomic) IBOutlet UIView *mainV;

@property(nonatomic,strong)UITableView *tableview;
//动态的可变数组
@property (nonatomic,strong)NSMutableArray *DTArray;

@end

@implementation HNPDiscoveryViewC

static NSString *IDOne = @"PushCellID";
static NSString *IDTwo = @"DynamicCellID";


- (void)viewDidLoad {
    
    [super viewDidLoad];
 
    
    //加载网络数据解析Json并且进行字典转模型
    [self DTJson];
       //在view中添加tableView
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - ([UIApplication sharedApplication].statusBarFrame.size.height + 44)) style:UITableViewStylePlain];
    
    [self.view addSubview:_tableview];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    
    [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPPushCell class]) bundle:nil] forCellReuseIdentifier:IDOne];
    [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPDynamicCell class]) bundle:nil] forCellReuseIdentifier:IDTwo];
    self.baiVC.backgroundColor = [UIColor whiteColor];
    _tableview.estimatedRowHeight = 100;
    _tableview.rowHeight = UITableViewAutomaticDimension;
    
}
- (void)DTJson{
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"http://api.yysc.online/user/talk/getTalkListByProject?pageNumber&pageSize&project=futures"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        //Json转字典
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        //临时可变数组
        NSMutableArray *tempMutableArray = [NSMutableArray array];
        //字典数组
        NSArray *listArray = dict[@"data"][@"list"];
        //遍历字典数组
        for (NSDictionary *dict in listArray) {
            HNPDynamicModle *tempModel = [[HNPDynamicModle alloc] init];
            tempModel = [HNPDynamicModle DynamicWithDict:dict];
            [tempMutableArray addObject:tempModel];
        }
        self.DTArray = tempMutableArray;
//刷新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableview reloadData];
        }];
         }]resume];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.DTArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //通过判断加载两个xib
    if (indexPath.section == 0) {
            HNPPushCell *pushCell = [tableView dequeueReusableCellWithIdentifier:IDOne];
            //cell的选中样式
            //pushCell.selectionStyle = UITableViewCellSelectionStyleNone;
            //NSLog(@"%zd-%p",indexPath.row,pushCell);
            return pushCell;
        } else {
            HNPDynamicCell *DynamicCell = [tableView dequeueReusableCellWithIdentifier:IDTwo];
            //传递数据
            DynamicCell.DTModel = self.DTArray[indexPath.row];
            //自定义的点击头像跳转的代理方法设置代理对象
            DynamicCell.delegate = self;
            return DynamicCell;
        }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"jump" object:self];
        HNPFabuVC *fabuVC = [[HNPFabuVC alloc]init];
        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController:fabuVC animated:YES];
    }else{
        
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"jump" object:self];
    HNPDetailsVC *detailsVc = [[HNPDetailsVC alloc]init];
    //将数据传给详情页面的模型属性
    detailsVc.dynamicModle = self.DTArray[indexPath.row];
        //底部tabbar隐藏
        self.tabBarController.tabBar.hidden=YES;
        [self.navigationController pushViewController:detailsVc animated:YES];
    }
}

//自定义一个代理进行跳转
-(void)dynamicCellDidImageClick:(HNPDynamicCell *)DynamicCell{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"jump" object:self];
    HNPUserCenterVC *userCenterVC = [[HNPUserCenterVC alloc] init];
    userCenterVC.UserCenterModle = DynamicCell.DTModel;
    userCenterVC.UserDynamicM = DynamicCell.DTModel;
    [self.navigationController pushViewController:userCenterVC animated:YES];
    
}


@end
