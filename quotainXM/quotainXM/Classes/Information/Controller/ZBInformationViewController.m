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


@interface ZBInformationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign)NSInteger heightconst;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *array;

@end

@implementation ZBInformationViewController

static NSString *top_ID = @"TopTableViewCell";
static NSString *bot_ID = @"BottomTableViewCell";
static NSString *ID = @"InfoCollectionCell";
static NSString *header_ID = @"InfoHeaderReusableView";
static NSString *fooder_ID = @"InfoFooderReusableView";


- (NSMutableArray *)array{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}

- (void)viewDidAppear:(BOOL)animated{
    [self reLoadHotnews];
}
- (void)viewDidLoad {
    [super viewDidLoad];

        //设置tableView
            CGRect tabTemp = CGRectMake(0,44 + [[UIApplication sharedApplication] statusBarFrame].size.height,[[UIApplication sharedApplication] statusBarFrame].size.width,self.view.frame.size.height);
        self.tableView = [[UITableView alloc] initWithFrame:tabTemp style:UITableViewStylePlain];
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
        cell.model = _array[indexPath.row];
        return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //
}

-(void)reLoadHotnews{
    
    NSURL *url = [NSURL URLWithString:@"http://api.yysc.online/user/talk/getTalkListByProject?project=futures&pageNumber&pageSize"];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSArray *dataArray = dict[@"data"][@"list"];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in dataArray) {
            ZBHotNewsModel *model = [ZBHotNewsModel ZBHotNewsModelWithDict:dict];
            [temp addObject:model];
        }
        self.array = temp;
        dispatch_async(dispatch_get_main_queue(), ^{
           [self.tableView reloadData];
        });
    }]resume];
}

@end
