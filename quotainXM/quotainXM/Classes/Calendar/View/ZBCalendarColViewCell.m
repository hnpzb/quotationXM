//
//  ZBCalendarColViewCell.m
//  quotainXM
//
//  Created by 朱彬 on 2020/6/15.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBCalendarColViewCell.h"

@interface ZBCalendarColViewCell ()

@property(nonatomic,strong)UIButton *preSelectBtn;
@property(nonatomic,strong)UIButton *btn;

@end

@implementation ZBCalendarColViewCell

- (void)setFlag:(NSString *)flag{
    _flag = flag;
    [_btn setTitle:flag forState:UIControlStateNormal];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self addDayBtn:self.contentView];
   
    
    
}

-(void)addDayBtn:(UIView *)view{
    
    _btn.frame = view.bounds;
    [view addSubview:_btn];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"1"  attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
//    btn.titleLabel.attributedText = string;
    [_btn setAttributedTitle:string forState:UIControlStateNormal];
    
    
    NSMutableAttributedString *string_s = [[NSMutableAttributedString alloc] initWithString:@"25" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
    [_btn setAttributedTitle:string_s forState:UIControlStateSelected];
    [_btn setBackgroundImage:[UIImage imageNamed:@"pic_xuanzhong"] forState:UIControlStateSelected];
    _btn.enabled = YES;
    [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)btnClick:(UIButton *)btn{


    //1.取消上一个选中状态
//    self.preSelectBtn.selected = NO;
    //2.当前点击的按钮成为选中状态
    btn.selected = YES;
    //3.当前点击的按钮成为上一个选中状态按钮
    self.preSelectBtn = btn;

}




@end
