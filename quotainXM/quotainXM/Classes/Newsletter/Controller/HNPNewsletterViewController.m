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

@interface HNPNewsletterViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HNPNewsletterViewController

static NSString *ID = @"NewSletterID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITableView *tableView = [[UITableView alloc] init];
    CGRect temp = CGRectMake(0,[UIApplication sharedApplication].statusBarFrame.size.height + 44 , [UIApplication sharedApplication].statusBarFrame.size.width, self.view.frame.size.height);
//       temp.origin = CGPointMake(0, 80);
       tableView.frame = temp;
    [self.view addSubview:tableView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
    tableView.dataSource = self;
    tableView.delegate = self;

    //注册cell加载xib
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HNPNewSletterCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    tableView.estimatedRowHeight = 44;
    tableView.rowHeight = UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

//cell的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HNPNewSletterCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [HNPNewSletterCell NewSletterXib];
        
    }
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
