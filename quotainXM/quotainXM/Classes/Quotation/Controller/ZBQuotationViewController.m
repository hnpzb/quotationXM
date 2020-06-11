//
//  ZBQuotationViewController.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/5.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBQuotationViewController.h"

@interface ZBQuotationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSDictionary *dict;
@property(nonatomic,strong)UIButton *preSelectBtn;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ZBQuotationViewController

static NSString *ID = @"quotation";
- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] init];
    CGRect temp = self.view.bounds;
    temp.origin = CGPointMake(0,[UIApplication sharedApplication].statusBarFrame.size.height + 88);
    _tableView.frame = temp;
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.dict =@{@"contract":@"沪铜1811",
          @"price":@"48770",
          @"dataChang":@"-0.12",
          @"volume":@"8910"
    };
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZBQuotationTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0,[UIApplication sharedApplication].statusBarFrame.size.height + 44,[UIApplication sharedApplication].statusBarFrame.size.width,44);
    view.backgroundColor = [UIColor colorWithRed:247/255.0 green:248/255.0 blue:251/255.0 alpha:1.0];
    [self addLabelOne:view index:0 name:@"主力"];
    [self addLabelOne:view index:1 name:@"大连"];
    [self addLabelOne:view index:2 name:@"上海"];
    [self addLabelOne:view index:3 name:@"三期能源"];
   
    [self addLabelOne:view index:4 name:@"上期"];
    [self.view addSubview:view];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0,0,self.view.frame.size.width,0);
    view.backgroundColor = [UIColor whiteColor];
   [self addLabelTwo:view index:0 name:@"合约名称"];
    [self addLabelTwo:view index:1 name:@"最新价"];
    [self addLabelTwo:view index:2 name:@"涨   跌"];
    [self addLabelTwo:view index:3 name:@"成交量"];
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZBQuotationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.qutation =  [ZBQuotationModal quotationModalWithDict:self.dict];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(void)addLabelOne:(UIView *)view index:(NSInteger)i name:(NSString *)name {
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(([UIApplication sharedApplication].statusBarFrame.size.width / 5) * i, 0, self.view.frame.size.width / 5, 44);
    [view addSubview:btn];

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 17],NSForegroundColorAttributeName: [UIColor colorWithRed:189/255.0 green:192/255.0 blue:195/255.0 alpha:1.0]}];
    [btn setAttributedTitle:string forState:UIControlStateNormal];
  

    NSMutableAttributedString *string_s = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 17],NSForegroundColorAttributeName: [UIColor colorWithRed:253/255.0 green:78/255.0 blue:73/255.0 alpha:1.0]}];
    [btn setAttributedTitle:string_s forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)addLabelTwo:(UIView *)view index:(NSInteger)i name:(NSString *)name {
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(15+(self.view.frame.size.width / 4 + 8)  * i,0,self.view.frame.size.width / 4,44);
    label.numberOfLines = 0;
    [view addSubview:label];
    label.text = name;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    label.textColor = [UIColor colorWithRed:189/255.0 green:192/255.0 blue:195/255.0 alpha:1.0];
    if (i == 2 || i == 3) {
        UIImageView *image_view=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Up and down toggle button"]];
        [label addSubview:image_view];
        image_view.frame = CGRectMake(52, 22, 7.5, 7.5);
        
    }
}
-(void)btnClick:(UIButton *)btn{


    //1.取消上一个选中状态
    self.preSelectBtn.selected = NO;
    //2.当前点击的按钮成为选中状态
    btn.selected = YES;
    //3.当前点击的按钮成为上一个选中状态按钮
    self.preSelectBtn = btn;

}


@end
