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
    
     [self setArrayDataWithTime:[HNPNewsletterViewController curYearMD:0]];
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setArrayDataWithTime:[HNPNewsletterViewController curYearMD:0]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tableView = [[UITableView alloc] init];
    CGRect temp = CGRectMake(0,[UIApplication sharedApplication].statusBarFrame.size.height + 44 , [UIApplication sharedApplication].statusBarFrame.size.width, self.view.frame.size.height);
       _tableView.frame = temp;
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //注册cell加载xib
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HNPNewSletterCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    _tableView.estimatedRowHeight = 44;
    _tableView.rowHeight = UITableViewAutomaticDimension;
//    NSString *temp_s = [self time_timestampToString:1592155048000];
//    NSLog(@"---%@",temp_s);

        /*AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"http://api.yysc.online/admin/getFinanceTalk?pageNum&pageSize&date" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSDictionary *data = responseObject;
    //        NSMutableArray *array = [NSMutableArray array];/Users/zhubin/Desktop/
    //        [data writeToFile:@"/Users/zhubin/Desktop/test.plist" atomically:YES];
            NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"failure");
        }];*/
    
    /*    long timeStamp= 1461896616000;

    NSString*tempTime =[[NSNumber numberWithLong:timeStamp] stringValue];

   NSMutableString*getTime = [NSMutableString stringWithFormat:@"%@",tempTime];


    //    NSMutableString *getTime = @"1461896616000";

   struct utsname systemInfo;

   uname(&systemInfo);

   [getTime deleteCharactersInRange:NSMakeRange(10,3)];

  

   NSDateFormatter *matter = [[NSDateFormatter alloc]init];

  matter.dateFormat =@"YYYY-MM-dd HH:mm";

     NSDate *date = [NSDate dateWithTimeIntervalSince1970:[getTime intValue]];

    NSString*timeStr = [matter stringFromDate:date];

   NSLog(@"%@",timeStr);//2016-04-29 10:23
     
     */
    
        
}

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
//    NSArray *array1 =[timeStr componentsSeparatedByString:@"-"];

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
//            [[NSOperationQueue mainQueue] addBarrierBlock:^{
//                [self.tableView reloadData];
//            }];
        }]resume];
    [self.tableView reloadData];
}

-(void)setArrayDataWithTime:(NSString *)time{
    NSString *path = [NSString stringWithFormat:@"http://api.yysc.online/admin/getFinanceTalk?pageNum&pageSize=100&date=%@",time];
    NSURL *url = [NSURL URLWithString:path];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//      NSLog(@"%ld",_dataArray.count);
//}
//
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
//    [self setArrayDataWithTime:[HNPNewsletterViewController curYearMD:section]];
    HNPNewSletterHerderView *view = [[HNPNewSletterHerderView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    view.model = self.dataArray[0];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%ld",_dataArray.count);
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
