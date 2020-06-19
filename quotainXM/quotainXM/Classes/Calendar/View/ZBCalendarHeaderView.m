//
//  ZBCalendarHeaderView.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/8.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBCalendarHeaderView.h"
#import "YXCalendarView.h"

@interface ZBCalendarHeaderView ()
@property(nonatomic,strong)UIButton *preSelectBtn;


@end

@implementation ZBCalendarHeaderView







/*
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(15,15,59.5,11.5);
        label.numberOfLines = 0;
        [self addSubview:label];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"2019年8月" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0]}];
        label.attributedText = string;
        
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(72,19,4.9,3.2);
        view.backgroundColor = [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0];
        view.layer.cornerRadius = 1;
        [self addSubview:view];
        
        [self addDayLabel:self index:0 name:@"日"];
         [self addDayLabel:self index:1 name:@"一"];
         [self addDayLabel:self index:2 name:@"二"];
         [self addDayLabel:self index:3 name:@"三"];
         [self addDayLabel:self index:4 name:@"四"];
         [self addDayLabel:self index:5 name:@"五"];
         [self addDayLabel:self index:6 name:@"六"];
        
        
        [self addDayBtn:self index:0 name:@"26"];
        [self addDayBtn:self index:1 name:@"27"];
        [self addDayBtn:self index:2 name:@"28"];
        [self addDayBtn:self index:3 name:@"29"];
        [self addDayBtn:self index:4 name:@"30"];
        [self addDayBtn:self index:5 name:@"31"];
        [self addDayBtn:self index:6 name:@"25"];
        
        
        
//        UIView *view_line = [[UIView alloc] init];
//        view_line.frame = CGRectMake(0,130,self.frame.size.width,5);
//        view_line.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
//        [self addSubview:view_line];
       
        
    }
    return self;
}

-(void)addDayLabel:(UIView *)view index:(NSInteger)i name:(NSString *)name{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(24 + ([UIApplication sharedApplication].statusBarFrame.size.width/7) * i,45,12,11);
    label.numberOfLines = 0;
    [view addSubview:label];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0]}];
    label.attributedText = string;
}
-(void)addDayBtn:(UIView *)view index:(NSInteger)i name:(NSString *)name{
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(5 + ([UIApplication sharedApplication].statusBarFrame.size.width/7) * i, 58, 50, 45);
    [view addSubview:btn];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
//    btn.titleLabel.attributedText = string;
    [btn setAttributedTitle:string forState:UIControlStateNormal];
    
    
    NSMutableAttributedString *string_s = [[NSMutableAttributedString alloc] initWithString:@"25" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
    [btn setAttributedTitle:string_s forState:UIControlStateSelected];
    [btn setBackgroundImage:[UIImage imageNamed:@"pic_xuanzhong"] forState:UIControlStateSelected];
    btn.enabled = YES;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)btnClick:(UIButton *)btn{


    //1.取消上一个选中状态
    self.preSelectBtn.selected = NO;
    //2.当前点击的按钮成为选中状态
    btn.selected = YES;
    //3.当前点击的按钮成为上一个选中状态按钮
    self.preSelectBtn = btn;

}


*/


@end
