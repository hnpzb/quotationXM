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
    
     [self setArrayData];
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setArrayData];
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
  

        /*AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"http://api.yysc.online/admin/getFinanceTalk?pageNum&pageSize&date" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSDictionary *data = responseObject;
    //        NSMutableArray *array = [NSMutableArray array];/Users/zhubin/Desktop/
    //        [data writeToFile:@"/Users/zhubin/Desktop/test.plist" atomically:YES];
            NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"failure");
        }];*/
   
    
    
        
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
//            NSLog(@"%ld",self.dataArray.count);
//            HNPNewSletterModle *model = self.dataArray[0];
//            NSLog(@"%@",model.content);
//            NSLog(@"%@",self.dataArray);
    //        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
//            [[NSOperationQueue mainQueue] addBarrierBlock:^{
//                [self.tableView reloadData];
//            }];
        }]resume];
    [self.tableView reloadData];
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
    HNPNewSletterHerderView *view = [[HNPNewSletterHerderView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
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
