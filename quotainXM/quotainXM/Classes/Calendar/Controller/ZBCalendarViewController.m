//
//  ZBCalendarViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/5.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBCalendarViewController.h"
#import "ZBCalendarHeaderView.h"
#import "ZBCalendarModel.h"
#import "YXCalendarView.h"

@interface ZBCalendarViewController ()<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong) YXCalendarView *calendar;

@end

@implementation ZBCalendarViewController
static  NSString  *ID = @"calendar";

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
        [self setArrayDataWithTime:[ZBCalendarViewController curYearMD]];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setArrayDataWithTime:[ZBCalendarViewController curYearMD]];
    // Do any additional setup after loading the view from its nib.
    _tableView = [[UITableView alloc] init];
    CGRect temp = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height +44, [UIApplication sharedApplication].statusBarFrame.size.width, self.view.frame.size.height-[UIApplication sharedApplication].statusBarFrame.size.height - 44 - 49);
    //    temp.origin = CGPointMake(0,[UIApplication sharedApplication].statusBarFrame.size.height +44);
    _tableView.frame = temp;
    
    if (@available(iOS 13.0, *)) {

        _tableView.frame = temp;

    } else {
        _tableView.frame = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44 , [UIApplication sharedApplication].statusBarFrame.size.width, self.view.frame.size.height - [[UIApplication sharedApplication] statusBarFrame].size.height - 275);
    }
    
    
    
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZBCalendarTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    UIView *view = [[UIView alloc] init];
       view.backgroundColor = [UIColor whiteColor];
       _calendar = [[YXCalendarView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [YXCalendarView getMonthTotalHeight:[NSDate date] type:CalendarType_Week] ) Date:[NSDate date] Type:CalendarType_Week];
       
       __weak typeof(_calendar) weakCalendar = _calendar;
       _calendar.refreshH = ^(CGFloat viewH) {
           [UIView animateWithDuration:0.3 animations:^{
               weakCalendar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, viewH);
           }];
           
       };
       __weak typeof(self) weakself = self;
       _calendar.sendSelectDate = ^(NSDate *selDate) {
//           NSLog(@"%@",[[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate]);
           if (@available(iOS 13.0, *)) {
               
               [weakself setArrayDataWithTime:[[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate]];
               
           } else {
//               NSDate *lastDay = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:selDate];
//               [weakself setArrayDataWithTime:[[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:lastDay]];
               [weakself setArrayDataWithTime:[[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate]];
           }
           
       };
       view.userInteractionEnabled = YES;
       [view addSubview:_calendar];
    _tableView.tableHeaderView = view;
    view.frame = CGRectMake(0, 0, 0, 112);
    
    
    //    UIView *view = [[UIView alloc] init];
    //    view.backgroundColor = [UIColor redColor];
    //    view.frame = CGRectMake(0, 65, self.view.frame.size.width, 150);
    //    tableView.tableHeaderView = view;
    //    tableView.contentInset = UIEdgeInsetsMake(42, 0, 0, 0);
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    
}
-(void)refresh
{
   [self setArrayDataWithTime:[ZBCalendarViewController curYearMD]];
}
-(void)loadMore
{
 [self setArrayDataWithTime:[ZBCalendarViewController curYearMD]];
}

- (void)viewDidAppear:(BOOL)animated{
    [self setArrayDataWithTime:[ZBCalendarViewController curYearMD]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZBCalendarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.model = _dataArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 112;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(void)setArrayDataWithTime:(NSString *)time{
    NSString *path = [NSString stringWithFormat:@"http://api.yysc.online/admin/getFinanceCalender?pageNum&pageSize&date=%@",time];
    NSURL *url = [NSURL URLWithString:path];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSArray *array= dict[@"data"];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            ZBCalendarModel *model = [ZBCalendarModel ZBCalendarModelWithDict:dict];
            [temp addObject:model];
        }
        self.dataArray = temp;
        dispatch_async(dispatch_get_main_queue(), ^{
           [self.tableView reloadData];
        });
       
        //            [[NSOperationQueue mainQueue] addBarrierBlock:^{
        //                [self.tableView reloadData];
        //            }];
    }]resume];
//    dispatch_async(dispatch_get_main_queue(), ^{
//       [self.tableView reloadData];
//    });
    
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


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
