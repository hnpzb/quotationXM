//
//  ZBHeaderCollectionView.m
//  quotainXM
//
//  Created by 朱彬 on 2020/6/15.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBHeaderCollectionView.h"
#import "ZBCalendarColViewCell.h"

@interface ZBHeaderCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ZBHeaderCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
static NSString *ID = @"calendarColCell";
- (instancetype)initWithW:(CGFloat)colW
{
    self = [super init];
    if (self) {
    
     NSInteger colH = 20;
     CGRect temp = CGRectMake(0, 0, colW, colH);
         //设置上部的collectionview
             CGFloat margin = 20;
             UICollectionViewFlowLayout *flowL = [[UICollectionViewFlowLayout alloc] init];
             //每个格子的大小
             CGFloat width = colW/7;
             flowL.itemSize = CGSizeMake(width, 20);

             //设置最小行间距
             flowL.minimumLineSpacing = 20;
             //设置最小间隔值.
             flowL.minimumInteritemSpacing = 20;
             //设置内边距
             flowL.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
        flowL.scrollDirection = UICollectionViewScrollDirectionHorizontal;
             UICollectionView *colView = [[UICollectionView alloc] initWithFrame:temp collectionViewLayout:flowL];
         colView.userInteractionEnabled = YES;;
             [self addSubview:colView];
             colView.backgroundColor = [UIColor clearColor];
             colView.dataSource = self;
             colView.delegate = self;
             [colView registerNib:[UINib nibWithNibName:@"ZBInfoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];

         
         
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBCalendarColViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.flag = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

@end
