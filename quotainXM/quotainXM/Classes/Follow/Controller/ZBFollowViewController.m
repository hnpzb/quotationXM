//
//  ZBFollowViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/9.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBFollowViewController.h"
#import "HNPPushCell.h"
#import "HNPDynamicCell.h"

@interface ZBFollowViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZBFollowViewController

static NSString *ID = @"DynamicCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 84, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 60) style:UITableViewStylePlain];

    [self.view addSubview:tableview];
    tableview.dataSource = self;
    tableview.delegate = self;
    
    [tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPDynamicCell class]) bundle:nil] forCellReuseIdentifier:ID];
    tableview.estimatedRowHeight = 80;
    tableview.rowHeight = UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        return 10;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //通过判断加载两个xib
        HNPPushCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HNPPushCell"];
//    HNPDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
     if (cell == nil && indexPath.section == 0) {
            cell = [HNPPushCell PushCellXib];

        }else{
                cell = [HNPDynamicCell DynamicXib];

        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell选中样式

    return cell;
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
