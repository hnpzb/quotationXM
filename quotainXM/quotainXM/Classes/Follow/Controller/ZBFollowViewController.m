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

@property(nonatomic,strong)UITableView *tableview;

@end

@implementation ZBFollowViewController

static NSString *IDOne = @"PushCellID";
static NSString *IDTwo = @"DynamicCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height ) style:UITableViewStylePlain];

    [self.view addSubview:_tableview];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    
    _tableview.estimatedRowHeight = 80;
    _tableview.rowHeight = UITableViewAutomaticDimension;

    [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPPushCell class]) bundle:nil] forCellReuseIdentifier:IDOne];
    [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([HNPDynamicCell class]) bundle:nil] forCellReuseIdentifier:IDTwo];
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
     if (indexPath.section == 0) {
                HNPPushCell *pushCell = [tableView dequeueReusableCellWithIdentifier:IDOne];
                //cell的选中样式
                pushCell.selectionStyle = UITableViewCellSelectionStyleNone;
                //NSLog(@"%zd-%p",indexPath.row,pushCell);
                return pushCell;
            } else {
                HNPDynamicCell *DynamicCell = [tableView dequeueReusableCellWithIdentifier:IDTwo];
                return DynamicCell;
            }
    
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
