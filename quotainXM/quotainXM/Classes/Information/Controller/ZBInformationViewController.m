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

@interface ZBInformationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign)NSInteger heightconst;

@end

@implementation ZBInformationViewController

static NSString *top_ID = @"TopTableViewCell";
static NSString *bot_ID = @"BottomTableViewCell";
static NSString *ID = @"InfoCollectionCell";
static NSString *header_ID = @"InfoHeaderReusableView";
static NSString *fooder_ID = @"InfoFooderReusableView";



- (void)viewDidLoad {
    [super viewDidLoad];
//    //设置上部的collectionview
//
//    CGRect temp = CGRectMake(0, 65, self.view.frame.size.width, colH);
//
//    CGFloat margin = 20;
//    UICollectionViewFlowLayout *flowL = [[UICollectionViewFlowLayout alloc] init];
//    //每个格子的大小
//    CGFloat width = (self.view.frame.size.width - 3 * margin) * 0.5;
//    flowL.itemSize = CGSizeMake(width, 60);
//
//    //设置最小行间距
//    flowL.minimumLineSpacing = 20;
//    //设置最小间隔值.
//    flowL.minimumInteritemSpacing = 20;
//    //设置内边距
//    flowL.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
//    //设置辅助视图的宽高
//    flowL.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 160);
//    flowL.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 160);
//
//    UICollectionView *colView = [[UICollectionView alloc] initWithFrame:temp collectionViewLayout:flowL];
////    colView.collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
////    colView.backgroundColor = [UIColor redColor];
//    colView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:colView];
////        colView.frame = temp;
//    colView.backgroundColor = [UIColor clearColor];
//    colView.dataSource = self;
//    colView.delegate = self;
//    [colView registerNib:[UINib nibWithNibName:@"ZBInfoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
//
//    [colView registerNib:[UINib nibWithNibName:@"ZBInfoHeaderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:header_ID];
//
//    [colView registerNib:[UINib nibWithNibName:@"ZBInfoFooderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:fooder_ID];
    
    //设置tableView
    UITableView *tableView = [[UITableView alloc] init];
    CGRect tabTemp = CGRectMake(0,44 + [[UIApplication sharedApplication] statusBarFrame].size.height,[[UIApplication sharedApplication] statusBarFrame].size.width,self.view.frame.size.height);
    tableView.frame = tabTemp;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
     ZBInfoCollectionView *view = [[ZBInfoCollectionView alloc] initWithW:tableView.frame.size.width];
    tableView.tableHeaderView = view;
    tableView.tableHeaderView.frame = CGRectMake(0, 0, 0, 500);
    
    [tableView registerNib:[UINib nibWithNibName:@"ZBTopTableViewCell" bundle:nil] forCellReuseIdentifier:top_ID];
    [tableView registerNib:[UINib nibWithNibName:@"ZBBottomTableViewCell" bundle:nil] forCellReuseIdentifier:bot_ID];
//    [colView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
//    UITableView *tableView = [[UITableView alloc] init];
//    tableView.dataSource = self;
//    tableView.delegate = self;
//    [self.view addSubview:tableView];
//
//
//    CGRect temp = self.view.bounds;
//    temp.origin = CGPointMake(0, 65);
//    tableView.frame = temp;
//    tableView.contentInset = UIEdgeInsetsMake(80, 0, 0, 0);
}


//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return 4;
//}
//- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
////    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    ZBInfoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    return cell;
//}
//
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    //判断是否为头部
//       if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//
//          ZBInfoHeaderReusableView  *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:header_ID forIndexPath:indexPath];
//           return headerV;
//       }else if([kind isEqualToString:UICollectionElementKindSectionFooter]){
//           ZBInfoFooderReusableView *fooderV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:fooder_ID forIndexPath:indexPath];
//           return fooderV;
//       }
//    return 0;
//
//}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
//         view.backgroundColor = [UIColor whiteColor];
//         return view;
//}
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
//    if (section == 0) {
//        return 1;
//    }
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
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    ZBMineViewController *mineVC = [[ZBMineViewController alloc] init];
//    [self.navigationController pushViewController:mineVC animated:YES];
//    
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 44;
//}
//-(void)setCollectionView{
//
//        CGRect temp = CGRectMake(0, 65, self.view.frame.size.width, colH);
//
//        CGFloat margin = 20;
//        UICollectionViewFlowLayout *flowL = [[UICollectionViewFlowLayout alloc] init];
//        //每个格子的大小
//        CGFloat width = (self.view.frame.size.width - 3 * margin) * 0.5;
//        flowL.itemSize = CGSizeMake(width, 60);
//
//        //设置最小行间距
//        flowL.minimumLineSpacing = 20;
//        //设置最小间隔值.
//        flowL.minimumInteritemSpacing = 20;
//        //设置内边距
//        flowL.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
//        //设置辅助视图的宽高
//        flowL.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 160);
//        flowL.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 160);
//
//        UICollectionView *colView = [[UICollectionView alloc] initWithFrame:temp collectionViewLayout:flowL];
//    //    colView.collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
//    //    colView.backgroundColor = [UIColor redColor];
//        colView.backgroundColor = [UIColor grayColor];
//        [self.view addSubview:colView];
//    //        colView.frame = temp;
//        colView.backgroundColor = [UIColor clearColor];
//        colView.dataSource = self;
//        colView.delegate = self;
//        [colView registerNib:[UINib nibWithNibName:@"ZBInfoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
//
//        [colView registerNib:[UINib nibWithNibName:@"ZBInfoHeaderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:header_ID];
//
//        [colView registerNib:[UINib nibWithNibName:@"ZBInfoFooderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:fooder_ID];
//}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 3;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 20;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *ID = @"information";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
//    }
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld--%ld",indexPath.section,indexPath.row];
//    return cell;
//}


@end
