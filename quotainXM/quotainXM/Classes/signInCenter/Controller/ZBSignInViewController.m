//
//  ZBSignInViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/9.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBSignInViewController.h"
//#import "YXCalendarView.h"
#import "ZBCalendarView.h"
#import <AFNetworking.h>
#import "ZBSignInModel.h"
#import <sys/utsname.h>
#import <AFNetworking.h>
#import "MBProgressHUD+XMG.h"

@interface ZBSignInViewController ()

@property(nonatomic,strong)UIButton *preSelectBtn;
@property (nonatomic, strong) ZBCalendarView *calendar;
@property (strong, nonatomic) IBOutlet UIView *redView;
@property (strong, nonatomic) IBOutlet UIView *TopView;
@property (strong, nonatomic) IBOutlet UIView *barView;
@property (strong, nonatomic) IBOutlet UIImageView *yellowImageV;
@property (strong, nonatomic) IBOutlet UIImageView *greyImageV;
@property (strong, nonatomic) IBOutlet UILabel *successiveDayLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalDayLabel;

@property (strong, nonatomic) IBOutlet UIImageView *signImageV_1;

@property (strong, nonatomic) IBOutlet UIImageView *signImageV_2;
@property (strong, nonatomic) IBOutlet UIImageView *signImageV_3;
@property (strong, nonatomic) IBOutlet UIButton *signInBtn;


@property(nonatomic,strong)NSString *selectTime;

@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation ZBSignInViewController

- (void)setSelectTime:(NSString *)selectTime{
    _selectTime = selectTime;
    self.totalDayLabel.text = [NSString stringWithFormat:@"%ld",self.dataArray.count];
    for (int i =0; i<self.dataArray.count; i++) {
        ZBSignInModel *temp = self.dataArray[i];
        if ([[self timetampTostring:temp.time.integerValue] isEqualToString:selectTime]) {
            self.successiveDayLabel.text = [NSString stringWithFormat:@"%@",temp.continueTimes];
            switch (temp.continueTimes.intValue) {
                case 0:
                    break;
                case 1:
                    self.signImageV_1.image = [UIImage imageNamed:@"第2天"];
                    break;
                case 2:
                    self.signImageV_1.image = [UIImage imageNamed:@"第2天"];
                    self.signImageV_2.image = [UIImage imageNamed:@"第2天"];
                    break;
                case 3:
                    self.signImageV_1.image = [UIImage imageNamed:@"第2天"];
                    self.signImageV_2.image = [UIImage imageNamed:@"第2天"];
                    self.signImageV_3.image = [UIImage imageNamed:@"第三天"];
                    break;
                default:
                    self.signImageV_1.image = [UIImage imageNamed:@"第2天"];
                    self.signImageV_2.image = [UIImage imageNamed:@"第2天"];
                    self.signImageV_3.image = [UIImage imageNamed:@"第三天"];
                    break;
            }
                break;
        }
        self.successiveDayLabel.text = @"0";
        self.signImageV_1.image = [UIImage imageNamed:@"未签到"];
        self.signImageV_2.image = [UIImage imageNamed:@"未签到"];
        self.signImageV_3.image = [UIImage imageNamed:@"未签到"];
            }
    
}


- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewWillAppear:(BOOL)animated{
    [self RefreshSignIn];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addTopCalendar];
    _yellowImageV.image = [UIImage imageNamed:@"pic_qiandaokuang"];
    _yellowImageV.backgroundColor = [UIColor clearColor];
    _greyImageV.image = [UIImage imageNamed:@"pic_bg"];
    _greyImageV.backgroundColor = [UIColor clearColor];
    [self RefreshSignIn];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.totalDayLabel.text = [NSString stringWithFormat:@"%ld",self.dataArray.count];
        for (int i =0; i<self.dataArray.count; i++) {
            ZBSignInModel *temp = self.dataArray[i];
            if ([[self timetampTostring:temp.time.integerValue] isEqualToString:[ZBSignInViewController curYearMD:0]]) {
                self.successiveDayLabel.text = [NSString stringWithFormat:@"%@",temp.continueTimes];
                switch (temp.continueTimes.intValue) {
                    case 0:
                        break;
                    case 1:
                        self.signImageV_1.image = [UIImage imageNamed:@"第2天"];
                        break;
                    case 2:
                        self.signImageV_1.image = [UIImage imageNamed:@"第2天"];
                        self.signImageV_2.image = [UIImage imageNamed:@"第2天"];
                        break;
                    case 3:
                        self.signImageV_1.image = [UIImage imageNamed:@"第2天"];
                        self.signImageV_2.image = [UIImage imageNamed:@"第2天"];
                        self.signImageV_3.image = [UIImage imageNamed:@"第三天"];
                        break;
                    default:
                        self.signImageV_1.image = [UIImage imageNamed:@"第2天"];
                        self.signImageV_2.image = [UIImage imageNamed:@"第2天"];
                        self.signImageV_3.image = [UIImage imageNamed:@"第三天"];
                        break;
                }
                break;
            }
            self.successiveDayLabel.text = @"0";
        }
    });
}

-(void)breakDeatail:(UIButton *)btn{
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickSignIn:(id)sender {
    [self ZBbeginSignIn];
}


-(void)addTopCalendar{
   
        _TopView.backgroundColor = [UIColor redColor];
    _calendar = [[ZBCalendarView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [ZBCalendarView getMonthTotalHeight:[NSDate date] type:CalendarType_Week] ) Date:[NSDate date] Type:CalendarType_Week Style:1];
            
        __weak typeof(_calendar) weakCalendar = _calendar;
            _calendar.refreshH = ^(CGFloat viewH) {
                [UIView animateWithDuration:0.3 animations:^{
                    weakCalendar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, viewH);
                }];

            };
    __weak typeof(self) weakself = self;
            _calendar.sendSelectDate = ^(NSDate *selDate) {
             //
                weakself.selectTime = [[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate];
                
            };
      
        [_TopView addSubview:_calendar];
    
    //添加顶部导航条
       _barView.backgroundColor = [UIColor whiteColor];
          UIButton *btn_back = [[UIButton alloc] init];
       
    btn_back.frame = CGRectMake(10.5,20,20,20);
       [btn_back setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
       [_barView addSubview:btn_back];
       [btn_back addTarget:self action:@selector(breakDeatail:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIApplication sharedApplication].statusBarFrame.size.width/2 -40, 20, 80, 20)];
    [_barView addSubview:nameLabel];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"签到中心" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 17],NSForegroundColorAttributeName: [UIColor colorWithRed:22/255.0 green:23/255.0 blue:31/255.0 alpha:1.0]}];

    nameLabel.attributedText = string;
}


-(void)RefreshSignIn{
    NSMutableDictionary *par = [[NSMutableDictionary alloc]init];
    [par setObject:self.userID forKey:@"userId"];
    

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.yysc.online/user/sign/getSignList" parameters:par headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = responseObject;
        NSString *success = [NSString stringWithFormat:@"%@",dict[@"success"]];
        NSDictionary *data = dict[@"data"];
        NSMutableArray *temp = [NSMutableArray array];
               if ([success isEqualToString:@"1"]) {
                   
                   for (NSDictionary *dict in data) {
                       ZBSignInModel *model = [ZBSignInModel ZBSignInModelWithDict:dict];
                       [temp addObject:model];
                   }
                   self.dataArray = temp;
                   
               }else{
                  
               }
    } failure:nil];
     
    
}


-(NSString *)timetampTostring:(NSInteger)timestamp{
    
    NSString *tempTime =[[NSNumber numberWithLong:timestamp] stringValue];
    NSMutableString *getTime = [NSMutableString stringWithFormat:@"%@",tempTime];

      //    NSMutableString *getTime = @"1461896616000";
     struct utsname systemInfo;
     uname(&systemInfo);

     [getTime deleteCharactersInRange:NSMakeRange(10,3)];
     NSDateFormatter *matter = [[NSDateFormatter alloc]init];
//    matter.dateFormat =@"YYYY-MM-dd HH:mm";
    matter.dateFormat =@"YYYY-MM-dd";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[getTime intValue]];

      NSString *timeStr = [matter stringFromDate:date];
//    NSArray *array1 =[timeStr componentsSeparatedByString:@"-"];

    return timeStr;
}

+(NSString *)curYearMD:(NSInteger)i{
    
    NSDate *date = [NSDate date];//这个是NSDate类型的日期，所要获取的年月日都放在这里；
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth| NSCalendarUnitDay;//这句是说你要获取日期的元素有哪些。获取年就要写NSYearCalendarUnit，获取小时就要写NSHourCalendarUnit，中间用|隔开；
    NSDateComponents *d = [cal components:unitFlags fromDate:date];//把要从date中获取的unitFlags标示的日期元素存放在NSDateComponents类型的d里面； //然后就可以从d中获取具体的年月日了；
    NSInteger year = [d year];
    NSInteger month = [d month];
    NSInteger day = [d day];
    NSString *time = [NSString stringWithFormat:@"%ld-%ld-%ld",year,month,day - i];
    return time;
}

-(void)ZBbeginSignIn{
    
    NSMutableDictionary *par = [[NSMutableDictionary alloc]init];
    [par setObject:self.userID forKey:@"userId"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://api.yysc.online/user/sign/signNow" parameters:par headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        NSDictionary *data = responseObject;
        NSString *success = [NSString stringWithFormat:@"%@",data[@"success"]];
        if ([success isEqualToString:@"1"]) {
            [MBProgressHUD showMessage:@"签到成功..."];
            
            //延时执行代码
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 [MBProgressHUD hideHUD];
                self.signInBtn.enabled = NO;
                [self RefreshSignIn];
                self.selectTime = [ZBSignInViewController curYearMD:0];
                    
                });
        }else{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"签到失败"];
        }
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"failure");
        }];
        
    
}


@end
