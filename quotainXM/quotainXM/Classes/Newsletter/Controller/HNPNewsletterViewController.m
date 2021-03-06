//
//  HNPNewsletterViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/8.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPNewsletterViewController.h"
#import "HNPNewSletterCell.h"
#import "HNPNewSletterHerderView.h"
#import <AFNetworking.h>
#import "Masonry.h"
#import <sys/utsname.h>
@interface HNPNewsletterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation HNPNewsletterViewController

static NSString *ID = @"NewSletterID";

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidAppear:(BOOL)animated{
    
     [self setArrayDataWithTime:[HNPNewsletterViewController curYearMD]];
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setArrayDataWithTime:[HNPNewsletterViewController curYearMD]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    _tableView = [[UITableView alloc] init];

    CGRect temp = CGRectMake(0,[UIApplication sharedApplication].statusBarFrame.size.height + 44 , [UIApplication sharedApplication].statusBarFrame.size.width, self.view.frame.size.height - 44 - [[UIApplication sharedApplication] statusBarFrame].size.height - 49);
//    _tableView = [[UITableView alloc] initWithFrame:temp style:UITableViewStylePlain];
    
    if (@available(iOS 13.0, *)) {
        
        self.tableView = [[UITableView alloc] initWithFrame:temp style:UITableViewStylePlain];
        
    } else {
         self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,[UIApplication sharedApplication].statusBarFrame.size.height + 44 , [UIApplication sharedApplication].statusBarFrame.size.width, self.view.frame.size.height  - [[UIApplication sharedApplication] statusBarFrame].size.height - 235) style:UITableViewStyleGrouped];
       self.tableView.contentInset  = UIEdgeInsetsMake(-20,0, 0, 0);
    }
    

    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //注册cell加载xib
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HNPNewSletterCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    _tableView.estimatedRowHeight = 44;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
        
}

-(void)refresh
{
    [self setArrayDataWithTime:[HNPNewsletterViewController curYearMD]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
           });
}
-(void)loadMore
{
   [self setArrayDataWithTime:[HNPNewsletterViewController curYearMD]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self.tableView.mj_footer endRefreshing];
       });
}

//时间戳
+(NSString *)timetampTostring:(long)timestamp{
    
    NSString *tempTime =[[NSNumber numberWithLong:timestamp] stringValue];
    NSMutableString *getTime = [NSMutableString stringWithFormat:@"%@",tempTime];

      //    NSMutableString *getTime = @"1461896616000";
     struct utsname systemInfo;
     uname(&systemInfo);

     [getTime deleteCharactersInRange:NSMakeRange(10,3)];
     NSDateFormatter *matter = [[NSDateFormatter alloc]init];
//    matter.dateFormat =@"YYYY-MM-dd HH:mm";
    matter.dateFormat = @"YYYY-MM-dd";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[getTime intValue]];

      NSString *timeStr = [matter stringFromDate:date];
    return timeStr;
}

-(NSString *)time_timestampToString:(NSInteger)timestamp{
    
    NSDate *conformTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
//    [dateFormat setDateFormat:@"HH:mm"];
    NSString *string = [dateFormat stringFromDate:conformTimesp];
    return string;
}

-(void)setArrayData{
     NSURL *url = [NSURL URLWithString:@"http://api.yysc.online/admin/getFinanceTalk?pageNum&pageSize&date"];
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSArray *array= dict[@"data"];
            NSMutableArray *temp = [NSMutableArray array];
            for (NSDictionary *dict in array) {
                HNPNewSletterModle *model = [HNPNewSletterModle NewSletterModleWithDict:dict];
                [temp addObject:model];
            }
            self.dataArray = temp;
        }]resume];
    [self.tableView reloadData];
}

-(void)setArrayDataWithTime:(NSString *)time{
    NSString *path = [NSString stringWithFormat:@"http://api.yysc.online/admin/getFinanceTalk?pageNum&pageSize=30&date=%@",time];
    NSURL *url = [NSURL URLWithString:path];
            NSURLSession *session = [NSURLSession sharedSession];
            [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (data.length != 0) {
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                    NSArray *array= dict[@"data"];
                    NSMutableArray *temp = [NSMutableArray array];
                    for (NSDictionary *dict in array) {
                        HNPNewSletterModle *model = [HNPNewSletterModle NewSletterModleWithDict:dict];
                        [temp addObject:model];
                    }
                    self.dataArray = temp;
                }else{
                    //
                }
                
            }]resume];
        [self.tableView reloadData];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


//cell的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HNPNewSletterCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [HNPNewSletterCell NewSletterXib];
    }
    cell.NewSletter = self.dataArray[indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HNPNewSletterHerderView *view = [[HNPNewSletterHerderView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    if (self.dataArray.count != 0) {
        view.model = self.dataArray[0];
    }else{
        
    }
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
