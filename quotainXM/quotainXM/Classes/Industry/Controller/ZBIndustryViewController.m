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
    [self.view addSubview:_tabView];
//    tabView.frame = self.view.bounds;
    CGRect temp = CGRectMake(0, 0, [UIApplication sharedApplication].statusBarFrame.size.width, self.view.frame.size.height);
    temp.origin = CGPointMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44 );
       _tabView.frame = temp;
    _tabView.dataSource =self ;
    _tabView.delegate = self ;
    _tabView.estimatedRowHeight = 44;
    _tabView.rowHeight = UITableViewAutomaticDimension;
    
    [_tabView registerNib:[UINib nibWithNibName:NSStringFromClass([ZBIndustryTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
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
    NSString *path = [NSString stringWithFormat:@"http://api.yysc.online/admin/getFinanceAffairs?pageNum&pageSize=100&date=%@",[ZBIndustryViewController curYearMD:0]];
                      
     NSURL *url = [NSURL URLWithString:path];
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    //        NSArray *arr = dict[@"data"];
            NSMutableArray *temp = [NSMutableArray array];
            NSArray *array= dict[@"data"];
            for (NSDictionary *dict in array) {
                ZBIndustryMode *model = [ZBIndustryMode ZBIndustryModeWithDict:dict];
                [temp addObject:model];
            }
            self.dataArray = temp;
//            HNPNewSletterModle *model = self.dataArray[0];
//            NSLog(@"%@",model.content);
//            NSLog(@"%@",self.dataArray);
    //        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
//            }];
        }]resume];
    [self.tabView reloadData];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZBIndustryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.industryModel = _dataArray[indexPath.row];
    return cell;
}
//ZBIndustryTableViewCell *cell;
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    // 创建一个临时的cell(目的:为了传递indexPath这一行对应的模型数据去布局所有的子控件,得到所有子控件的frame,进而计算cell的高度)
//     if (cell == nil) {
//         cell = [tableView dequeueReusableCellWithIdentifier:ID];
//     }
//
//
//    return cell.cellHeight;
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
