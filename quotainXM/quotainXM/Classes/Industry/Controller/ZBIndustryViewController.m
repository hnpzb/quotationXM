//
//  ZBIndustryViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/5.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBIndustryViewController.h"

@interface ZBIndustryViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *dataArray;
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
    
    [_tabView registerNib:[UINib nibWithNibName:NSStringFromClass([ZBIndustryTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
//    tabView.contentInset = UIEdgeInsetsMake(22, 0, 0, 0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZBIndustryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    return cell;
}
ZBIndustryTableViewCell *cell;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 创建一个临时的cell(目的:为了传递indexPath这一行对应的模型数据去布局所有的子控件,得到所有子控件的frame,进而计算cell的高度)
     if (cell == nil) {
         cell = [tableView dequeueReusableCellWithIdentifier:ID];
     }
     
     // 传递数据
//    cell.industryModel = self.dataArray[indexPath.row];
    
     
     return cell.cellHeight;
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
