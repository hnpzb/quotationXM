//
//  ZBIndustryViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/5.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBIndustryViewController.h"

@interface ZBIndustryViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UITableView *tabView;
@end

@implementation ZBIndustryViewController


static NSString *ID = @"industry";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tabView = [[UITableView alloc] init];
    _tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tabView];
//    tabView.frame = self.view.bounds;
    CGRect temp = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44 , [UIApplication sharedApplication].statusBarFrame.size.width, self.view.frame.size.height - 44 - [[UIApplication sharedApplication] statusBarFrame].size.height - 49);
    if (@available(iOS 13.0, *)) {

        _tabView.frame = temp;

    } else {
        _tabView.frame = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44 , [UIApplication sharedApplication].statusBarFrame.size.width, self.view.frame.size.height - [[UIApplication sharedApplication] statusBarFrame].size.height - 275);
         self.tabView.contentInset  = UIEdgeInsetsMake(-30,0, 0, 0);
    }
    
//    _tabView.frame = temp;
    _tabView.dataSource =self ;
    _tabView.delegate = self ;
    _tabView.estimatedRowHeight = 44;
    _tabView.rowHeight = UITableViewAutomaticDimension;
    
    [_tabView registerNib:[UINib nibWithNibName:NSStringFromClass([ZBIndustryTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    self.tabView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
       
       self.tabView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
}
-(void)refresh
{
     [self setArrayData];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self.tabView.mj_header endRefreshing];
       });
}
-(void)loadMore
{
    [self setArrayData];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self.tabView.mj_footer endRefreshing];
       });
}

- (void)viewDidAppear:(BOOL)animated{
    [self setArrayData];
}

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setArrayData];
    }
    return self;
}

-(void)setArrayData{
    NSString *path = [NSString stringWithFormat:@"http://api.yysc.online/admin/getFinanceAffairs?pageNum&pageSize=100&date=%@",[ZBIndustryViewController curYearMD]];
                      
     NSURL *url = [NSURL URLWithString:path];
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data.length != 0) {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                NSMutableArray *temp = [NSMutableArray array];
                NSArray *array= dict[@"data"];
                for (NSDictionary *dict in array) {
                    ZBIndustryMode *model = [ZBIndustryMode ZBIndustryModeWithDict:dict];
                    [temp addObject:model];
            }
            self.dataArray = temp;
                
            }else{
                
            }
            
        }]resume];
    [self.tabView reloadData];
}

+(NSString *)curYearMD{
    
    
    //获取当前时间日期
          NSDate *date=[NSDate date];
          NSDateFormatter *format1=[[NSDateFormatter alloc] init];
          [format1 setDateFormat:@"yyyy-MM-dd"];
          NSString *dateStr;
          dateStr=[format1 stringFromDate:date];
          return dateStr;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZBIndustryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.industryModel = _dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



@end
