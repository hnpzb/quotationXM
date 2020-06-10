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

@end

@implementation ZBIndustryViewController

static NSString *ID = @"industry";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITableView *tabView = [[UITableView alloc] init];
    [self.view addSubview:tabView];
//    tabView.frame = self.view.bounds;
    CGRect temp = self.view.bounds;
       temp.origin = CGPointMake(0, 85);
       tabView.frame = temp;
    tabView.dataSource =self ;
    tabView.delegate = self ;
    
    [tabView registerNib:[UINib nibWithNibName:NSStringFromClass([ZBIndustryTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
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
