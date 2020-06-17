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


@interface ZBCalendarViewController ()<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UITableView *tableView;

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
        [self setArrayDataWithTime:[ZBCalendarViewController curYearMD:0]];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setArrayDataWithTime:[ZBCalendarViewController curYearMD:0]];
    // Do any additional setup after loading the view from its nib.
    _tableView = [[UITableView alloc] init];
    CGRect temp = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height +44, [UIApplication sharedApplication].statusBarFrame.size.width, self.view.frame.size.height);
//    temp.origin = CGPointMake(0,[UIApplication sharedApplication].statusBarFrame.size.height +44);
       _tableView.frame = temp;
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZBCalendarTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];;
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    view.frame = CGRectMake(0, 65, self.view.frame.size.width, 150);
//    tableView.tableHeaderView = view;
//    tableView.contentInset = UIEdgeInsetsMake(42, 0, 0, 0);
   
}
- (void)viewDidAppear:(BOOL)animated{
    [self setArrayDataWithTime:[ZBCalendarViewController curYearMD:0]];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ZBCalendarHeaderView *view = [[ZBCalendarHeaderView alloc] init];
//    view.backgroundColor = [UIColor redColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
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
    //            [[NSOperationQueue mainQueue] addBarrierBlock:^{
    //                [self.tableView reloadData];
    //            }];
            }]resume];
        [self.tableView reloadData];
}

+(NSString *)curYearMD:(NSInteger)i{
    
    NSDate *date = [NSDate date];//这个是NSDate类型的日期，所要获取的年月日都放在这里；
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth| NSCalendarUnitDay;//这句是说你要获取日期的元素有哪些。获取年就要写NSYearCalendarUnit，获取小时就要写NSHourCalendarUnit，中间用|隔开；
    NSDateComponents *d = [cal components:unitFlags fromDate:date];//把要从date中获取的unitFlags标示的日期元素存放在NSDateComponents类型的d里面； //然后就可以从d中获取具体的年月日了；
    NSInteger year = [d year];
    NSInteger month = [d month];
    NSInteger day = [d day];
    NSString *time = [NSString stringWithFormat:@"%ld-%ld-%ld",year,month,day - i];
    return time;
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
