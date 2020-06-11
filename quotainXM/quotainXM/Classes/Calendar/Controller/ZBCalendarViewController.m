//
//  ZBCalendarViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/5.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBCalendarViewController.h"
#import "ZBCalendarHeaderView.h"

@interface ZBCalendarViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZBCalendarViewController
static  NSString  *ID = @"calendar";
- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITableView *tableView = [[UITableView alloc] init];
    CGRect temp = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height +44, [UIApplication sharedApplication].statusBarFrame.size.width, self.view.frame.size.height);
//    temp.origin = CGPointMake(0,[UIApplication sharedApplication].statusBarFrame.size.height +44);
       tableView.frame = temp;
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZBCalendarTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];;
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    view.frame = CGRectMake(0, 65, self.view.frame.size.width, 150);
//    tableView.tableHeaderView = view;
//    tableView.contentInset = UIEdgeInsetsMake(42, 0, 0, 0);
   
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
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZBCalendarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 112;
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
