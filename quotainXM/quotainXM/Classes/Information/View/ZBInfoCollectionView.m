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

@interface ZBInfoCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end
@implementation ZBInfoCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
static NSString *ID = @"InfoCollectionCell";
static NSString *header_ID = @"InfoHeaderReusableView";
static NSString *fooder_ID = @"InfoFooderReusableView";

-(instancetype)initWithW:(NSInteger )colW{

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
        //    colView.collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        //    colView.backgroundColor = [UIColor redColor];
            colView.backgroundColor = [UIColor grayColor];
            [self addSubview:colView];
        //        colView.frame = temp;
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
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    ZBInfoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //判断是否为头部
       if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
           
          ZBInfoHeaderReusableView  *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:header_ID forIndexPath:indexPath];
           return headerV;
       }else if([kind isEqualToString:UICollectionElementKindSectionFooter]){
           ZBInfoFooderReusableView *fooderV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:fooder_ID forIndexPath:indexPath];
           return fooderV;
       }
    return 0;
    
}

@end
