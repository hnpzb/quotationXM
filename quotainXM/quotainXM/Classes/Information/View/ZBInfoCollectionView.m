//
//  ZBInfoCollectionView.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/8.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBInfoCollectionView.h"
#import "ZBInfoCollectionViewCell.h"
#import "ZBInfoHeaderReusableView.h"
#import "ZBInfoFooderReusableView.h"
#import "SDCycleScrollView.h"

@interface ZBInfoCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,SDCycleScrollViewDelegate>


@end
@implementation ZBInfoCollectionView


static NSString *ID = @"InfoCollectionCell";
static NSString *header_ID = @"InfoHeaderReusableView";
static NSString *fooder_ID = @"InfoFooderReusableView";

-(instancetype)initWithW:(CGFloat )colW{

    self = [super init];
    if (self) {
         //设置上部的collectionview
        NSInteger colH = 500;
            CGRect temp = CGRectMake(0, 0, colW, colH);

            CGFloat margin = 20;
            UICollectionViewFlowLayout *flowL = [[UICollectionViewFlowLayout alloc] init];
            //每个格子的大小
            CGFloat width = (colW - 3 * margin) * 0.5;
            flowL.itemSize = CGSizeMake(width, 60);

            //设置最小行间距
            flowL.minimumLineSpacing = 20;
            //设置最小间隔值.
            flowL.minimumInteritemSpacing = 20;
            //设置内边距
            flowL.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
            //设置辅助视图的宽高
            flowL.headerReferenceSize = CGSizeMake(colW, 160);
            flowL.footerReferenceSize = CGSizeMake(colW, 160);

            UICollectionView *colView = [[UICollectionView alloc] initWithFrame:temp collectionViewLayout:flowL];
        colView.userInteractionEnabled = YES;;
            [self addSubview:colView];
        //        colView.frame = temp;
        self.userInteractionEnabled = YES;
            colView.backgroundColor = [UIColor clearColor];
            colView.dataSource = self;
            colView.delegate = self;
            [colView registerNib:[UINib nibWithNibName:@"ZBInfoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];

            [colView registerNib:[UINib nibWithNibName:@"ZBInfoHeaderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:header_ID];

            [colView registerNib:[UINib nibWithNibName:@"ZBInfoFooderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:fooder_ID];
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBInfoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.userInteractionEnabled = YES;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //判断是否为头部
       if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
           
          ZBInfoHeaderReusableView  *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:header_ID forIndexPath:indexPath];
           [self setCycleScrollView:headerV];
           return headerV;
       }else if([kind isEqualToString:UICollectionElementKindSectionFooter]){
           ZBInfoFooderReusableView *fooderV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:fooder_ID forIndexPath:indexPath];
           [self setFooderView:fooderV];
           return fooderV;
       }
    return 0;
    
}

-(void)setFooderView:(UIView *)view{
    [self addImageView:1 view:view];
    [self addImageView:2 view:view];
    [self addImageView:3 view:view];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"pic_qiandap "];
    imageView.frame = CGRectMake(20, 80, [UIApplication sharedApplication].statusBarFrame.size.width - 40, 48);
    [view addSubview:imageView];
}
-(void)addImageView:(NSInteger)i view:(UIView *)view{
        CGFloat margin = 5;
    CGFloat imageViewW = ([UIApplication sharedApplication].statusBarFrame.size.width-20) /3 ;
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"pic_bg_%ld",i]];
        imageView.frame = CGRectMake(margin + ( margin + imageViewW) * (i - 1) ,margin * 2, imageViewW, 54);
        [self addLabelOne:imageView];
        [self addLabelTwo:imageView];
        [view addSubview:imageView];
}

-(void)addLabelOne:(UIView *)view{
       UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(10,10,75.5,13.5);
        label.numberOfLines = 1;
        [view addSubview:label];

        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"每日动态" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];

        label.attributedText = string;
}
-(void)addLabelTwo:(UIView *)view{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10,30,59.5,9.5);
    label.numberOfLines = 1;
    [view addSubview:label];

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"精彩不断" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 10],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:208/255.0 blue:213/255.0 alpha:1.0]}];

    label.attributedText = string;
}

-(void)setCycleScrollView:(UIView *)view{
    UIImageView *backgroundView = [[UIImageView alloc] init];
    backgroundView.frame = view.bounds;
    [view addSubview:backgroundView];
    
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.frame];
//    demoContainerView.contentSize = CGSizeMake(view.frame.size.width, 100);
    [view addSubview:demoContainerView];
    
    // 情景一：采用本地图片实现
    NSArray *imageNames = @[@"pic_banner",
                            @"banner_home",
                            @"banner_hangqing",
                            ];

     CGFloat w = view.bounds.size.width;
    CGFloat h = view.bounds.size.height;
    
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, h) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    cycleScrollView.backgroundColor = [UIColor whiteColor];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [demoContainerView addSubview:cycleScrollView];
    cycleScrollView.autoScrollTimeInterval = 2.0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"asd");
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
//    [self.navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}


@end
