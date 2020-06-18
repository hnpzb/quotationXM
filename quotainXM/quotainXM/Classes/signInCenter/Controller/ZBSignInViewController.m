//
//  ZBSignInViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/9.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBSignInViewController.h"
#import "YXCalendarView.h"

@interface ZBSignInViewController ()

@property(nonatomic,strong)UIButton *preSelectBtn;
@property (nonatomic, strong) YXCalendarView *calendar;
@property (strong, nonatomic) IBOutlet UIView *redView;

@end

@implementation ZBSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.view.backgroundColor = [UIColor redColor];
//    [self addHeaderView];
    UIView *vc = [[UIView alloc] init];
    vc.backgroundColor = [UIColor whiteColor];
    vc.frame = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, [UIScreen mainScreen].bounds.size.width, 44);
       UIButton *btn_back = [[UIButton alloc] init];
    [self.view addSubview:vc];
    
    UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
//         _calendar = [[YXCalendarView alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44, [UIScreen mainScreen].bounds.size.width, [YXCalendarView getMonthTotalHeight:[NSDate date] type:CalendarType_Week] ) Date:[NSDate date] Type:CalendarType_Week];
    _calendar = [[YXCalendarView alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44, [UIScreen mainScreen].bounds.size.width, [YXCalendarView getMonthTotalHeight:[NSDate date] type:CalendarType_Week] ) Date:[NSDate date] Type:CalendarType_Week Style:1];
            
        __weak typeof(_calendar) weakCalendar = _calendar;
            _calendar.refreshH = ^(CGFloat viewH) {
                [UIView animateWithDuration:0.3 animations:^{
                    weakCalendar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, viewH);
                }];
                
            };
            _calendar.sendSelectDate = ^(NSDate *selDate) {
                NSLog(@"%@",[[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate]);
    //            [[NSOperationQueue mainQueue] addBarrierBlock:^{
    //            [self setArrayDataWithTime:[[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate]];
    //            }];
    //            [self setArrayDataWithTime:[[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate]];

            };
        view.userInteractionEnabled = YES;
        [view addSubview:_calendar];
    [self.view addSubview:view];
    self.view.userInteractionEnabled = YES;
    
    
    btn_back.frame = CGRectMake(10.5,20,20,20);
       [btn_back setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
       [vc addSubview:btn_back];
       [btn_back addTarget:self action:@selector(breakDeatail:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIApplication sharedApplication].statusBarFrame.size.width/2 -40, 20, 80, 20)];
    [vc addSubview:nameLabel];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"签到中心" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 17],NSForegroundColorAttributeName: [UIColor colorWithRed:22/255.0 green:23/255.0 blue:31/255.0 alpha:1.0]}];

    nameLabel.attributedText = string;
    
}
-(void)addHeaderView{
   
    [self addDayLabel:self.view index:0 name:@"Wed"];
    [self addDayLabel:self.view index:1 name:@"Thu"];
    [self addDayLabel:self.view index:2 name:@"Fri"];
    [self addDayLabel:self.view index:3 name:@"Sat"];
    [self addDayLabel:self.view index:4 name:@"Sun"];
    [self addDayLabel:self.view index:5 name:@"Mon"];
    [self addDayLabel:self.view index:6 name:@"Tub"];
           
    [self addDayBtn:self.view index:0 name:@"1"];
    [self addDayBtn:self.view index:1 name:@"2"];
    [self addDayBtn:self.view index:2 name:@"3"];
    [self addDayBtn:self.view index:3 name:@"4"];
    [self addDayBtn:self.view index:4 name:@"5"];
    [self addDayBtn:self.view index:5 name:@"6"];
    [self addDayBtn:self.view index:6 name:@"7"];
           
}
-(void)breakDeatail:(UIButton *)btn{
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addDayLabel:(UIView *)view index:(NSInteger)i name:(NSString *)name{
    

    
  /*  UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(24 + ([UIScreen mainScreen].bounds.size.width/8 )*i ,70,29,11);
    label.numberOfLines = 0;
    [view addSubview:label];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
    label.attributedText = string;  */
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - ([UIScreen mainScreen].bounds.size.width/8)*6 - 10*8) + ([UIScreen mainScreen].bounds.size.width/8) * i,60,29,11);
       label.numberOfLines = 0;
       [view addSubview:label];
       NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0]}];
       label.attributedText = string;
}
-(void)addDayBtn:(UIView *)view index:(NSInteger)i name:(NSString *)name{
    
   /* UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(30.5,112,4,10);
    label.numberOfLines = 0;
    [self.view addSubview:label];

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"1" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:253/255.0 green:81/255.0 blue:69/255.0 alpha:1.0]}];

    label.attributedText = string;
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(82,112,7,10.5);
    label.numberOfLines = 0;
    [self.view addSubview:label];

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"2" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];

    label.attributedText = string;
    label.alpha = 0.7;
    */
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - ([UIScreen mainScreen].bounds.size.width/8)*6 - 10*8) + ([UIScreen mainScreen].bounds.size.width/8 ) * i, 84, 10, 10.5);
    [view addSubview:btn];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0]}];
//    btn.titleLabel.attributedText = string;
    [btn setAttributedTitle:string forState:UIControlStateNormal];
    
    
//    NSMutableAttributedString *string_s = [[NSMutableAttributedString alloc] initWithString:@"25" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
      NSMutableAttributedString *string_s = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:253/255.0 green:81/255.0 blue:69/255.0 alpha:1.0]}];
    
    
    [btn setAttributedTitle:string_s forState:UIControlStateSelected];
    [btn setBackgroundImage:[UIImage imageNamed:@"椭圆 3"] forState:UIControlStateSelected];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
