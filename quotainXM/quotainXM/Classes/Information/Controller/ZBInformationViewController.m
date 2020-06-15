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

@interface ZBInformationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign)NSInteger heightconst;
@property(nonatomic,strong)UITableView *tableView;


@end

@implementation ZBInformationViewController

static NSString *top_ID = @"TopTableViewCell";
static NSString *bot_ID = @"BottomTableViewCell";
static NSString *ID = @"InfoCollectionCell";
static NSString *header_ID = @"InfoHeaderReusableView";
static NSString *fooder_ID = @"InfoFooderReusableView";



- (void)viewDidLoad {
    [super viewDidLoad];

    
    //设置tableView
    CGRect tabTemp = CGRectMake(0,44 + [[UIApplication sharedApplication] statusBarFrame].size.height,[[UIApplication sharedApplication] statusBarFrame].size.width,self.view.frame.size.height);
    _tableView = [[UITableView alloc] initWithFrame:tabTemp style:UITableViewStylePlain];
    
//    tableView.frame = tabTemp;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
     ZBInfoCollectionView *view = [[ZBInfoCollectionView alloc] initWithW:_tableView.frame.size.width];
    _tableView.tableHeaderView = view;
    _tableView.tableHeaderView.frame = CGRectMake(0, 0, 0, 500);
    
    [_tableView registerNib:[UINib nibWithNibName:@"ZBTopTableViewCell" bundle:nil] forCellReuseIdentifier:top_ID];
    [_tableView registerNib:[UINib nibWithNibName:@"ZBBottomTableViewCell" bundle:nil] forCellReuseIdentifier:bot_ID];
    
    //获取网络数据
    /*AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.yysc.online/user/talk/getRecommandTalk?project&userId&pageNumber&pageSize"]];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:nil completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {

    }]*/
   
    
    //通过AFN框架获取网络数据，不需转码（get）
    /*AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.yysc.online/user/talk/getTalkListByProject?pageNumber&pageSize&project=futures" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSDictionary *dada = responseObject[@"data"][@"list"];
            NSMutableArray *arrayN = [NSMutableArray array];
            for (NSArray *dict in dada) {
            [arrayN addObject:[TGIMGmode yy_modelWithDictionary:dict]];
        }
        self.AArray= arrayN;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.Tableview reloadData];
        }];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"@");
    }];*/
    
   
  /*  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.yysc.online/user/talk/getRecommandTalk?project&userId&pageNumber&pageSize" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = responseObject;
//        NSMutableArray *array = [NSMutableArray array];/Users/zhubin/Desktop/
//        [data writeToFile:@"/Users/zhubin/Desktop/test.plist" atomically:YES];
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure");
    }];
    */

 
    
    //通过系统提供的方法获取网络数据，需转码（get）
    
       /*NSURL *url = [NSURL URLWithString:@"http:api.yysc.online/user/talk/getRecommandTalk?project&userId&pageNumber&pageSize"];
           NSURLSession *session = [NSURLSession sharedSession];
           [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
               NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
               NSLog(@"%@",data);
               NSArray *arr = dict[@"data"][@"list"];
               NSMutableArray *arrayM = [NSMutableArray array];
               for (NSDictionary *smallDic in arr) {
                   [arrayM addObject:[SheQuModel SheQuWithDict:smallDic]];
               }
               self.guanzhus = arrayM;
               [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                   [self.tableView reloadData];
               }];
           }]resume];*/
    
    /*
    NSURL *url = [NSURL URLWithString:@"http://api.yysc.online/apidocs//banner/getBannerList?project="];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSArray *arr = dict[@"data"];
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }]resume];*/

    

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
//    view.backgroundColor = [UIColor greenColor];
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
//    if (section == 1) {
        return 44;
//    }else{
//        return 0;
//    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0 ) {
//        ZBTopTableViewCell *top_cell = [[ZBTopTableViewCell alloc] init];
//        ZBInfoCollectionView *view = [[ZBInfoCollectionView alloc] initWithW:tableView.frame.size.width];
//        [top_cell addSubview:view];
//
//        return top_cell;
//    }
//    else{
        ZBBottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:bot_ID];
        return cell;
//    }
//      static NSString *test_ID = @"information";
//      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:test_ID];
//      if (cell == nil) {
//          cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:test_ID];
//      }
//      cell.textLabel.text = [NSString stringWithFormat:@"%ld--%ld",indexPath.section,indexPath.row];
//      return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        return 500;
//    }
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"12345");
}


@end
