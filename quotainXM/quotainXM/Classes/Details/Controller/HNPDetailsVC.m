//
//  HNPDetailsVC.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/8.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPDetailsVC.h"
#import "HNPDetailsCell.h"
#import "HNPCommentCell.h"
#import "ZBDiscoverMainVC.h"
#import "HNPDynamicModle.h"
#import "AFNetworking.h"
#import "talkListModel.h"
#import "MJExtension/MJExtension.h"
#import "ZBCommentVC.h"
#import "ZBloginViewController.h"
#import "ZBJuBaoViewController.h"
#import "ZBPingBiViewController.h"
#import "ZBPingBiSuoSuoViewController.h"

@interface HNPDetailsVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)talkListModel *talk;

@property(nonatomic,strong)ZBPersonModel *mineUserInfoModel;

@end

@implementation HNPDetailsVC

static NSString *IDOne = @"DetailsCellID";
static NSString *IDTwo = @"CommentCellID";

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self determineWhetherToLogin];
    //在view中添加tableView
    [self creatTopView];
    [self creatTableView];
    [self PLJson];

    //轻扫返回上个界面手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView)];
    [self.view addGestureRecognizer:swipe];
//    NSLog(@"%@",_dynamicModle.publishTime);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginComment) name:@"beginComment" object:nil];
    
    
}

//-(void)PingBi{
//    [self PLJson];
//}
//-(void)PingBiSuoSuo{
//    [self PLJson];
//}
//
//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}

-(void)beginComment{
    [self determineWhetherToLogin];
    
    if (self.login == YES) {
        
            ZBCommentVC *vc = [[ZBCommentVC alloc] init];
            vc.talkID = self.dynamicModle.talkId;
            vc.userID = self.mineUserInfoModel.userId;
            [self presentViewController:vc animated:YES completion:nil];
        
            }else{
                
            ZBloginViewController *loginVC = [[ZBloginViewController alloc] init];
            loginVC.loginType = YES;
            [self presentViewController:loginVC animated:YES completion:nil];
                
            }
    
}

//轻扫返回
-(void)swipeView{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backPre" object:nil];
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 创建一个顶部View来进行控制器的切换
 */
- (void)creatTopView{
    //顶部点击图标切换控制器的view
       UIView *vc = [[UIView alloc] init];
       vc.backgroundColor = [UIColor whiteColor];
       vc.frame = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, [UIScreen mainScreen].bounds.size.width, 44);
       
       //创建返回按钮
       UIButton *btn_back = [[UIButton alloc] init];
       btn_back.frame = CGRectMake(10.5,20,20,20);
       [btn_back setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
       [vc addSubview:btn_back];
       //监听按钮的返回
       [btn_back addTarget:self action:@selector(breakDeatail:) forControlEvents:UIControlEventTouchUpInside];
       
       //创建更多按钮
       UIButton *btn_gd = [[UIButton alloc] init];
       btn_gd.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 30,20,10,20);
       [btn_gd setImage:[UIImage imageNamed:@"gengduo2"] forState:UIControlStateNormal];
       [vc addSubview:btn_gd];
    
    [btn_gd addTarget:self action:@selector(gengduoClick) forControlEvents:UIControlEventTouchUpInside];
       
       [self.view addSubview:vc];
}
//点击更多
-(void)gengduoClick{
    NSLog(@"123");
    
    
    [self determineWhetherToLogin];
    
    if (self.login == YES) {
        
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
               
               
               UIAlertAction *jubaoAction = [UIAlertAction actionWithTitle:@"举报说说" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                   NSLog(@"点击了举报说说");
                   ZBJuBaoViewController *jubao_vc = [[ZBJuBaoViewController alloc] init];
                   jubao_vc.talkID = self.dynamicModle.talkId;
                   jubao_vc.userID = self.dynamicModle.userId;
                   [self presentViewController:jubao_vc animated:YES completion:nil];
                   
                   
               }];
           
               UIAlertAction *pingbiAction = [UIAlertAction actionWithTitle:@"屏蔽该用户" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                       NSLog(@"点击了屏蔽该用户");
                   ZBPingBiViewController *pingbi_vc = [[ZBPingBiViewController alloc] init];
                   pingbi_vc.userID = self.dynamicModle.userId;
                   [self presentViewController:pingbi_vc animated:YES completion:nil];
                       
                   }];
            UIAlertAction *pingbiSuoSsuoAction = [UIAlertAction actionWithTitle:@"屏蔽该说说" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击了屏蔽该说说");
                ZBPingBiSuoSuoViewController *pingbiSuoSuo_vc = [[ZBPingBiSuoSuoViewController alloc] init];
                pingbiSuoSuo_vc.talkID = self.dynamicModle.talkId;
                pingbiSuoSuo_vc.userID = self.dynamicModle.userId;
                [self presentViewController:pingbiSuoSuo_vc animated:YES completion:nil];
                
            }];
               
           
               UIAlertAction *quexiaoAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

               }];
               

            [actionSheet addAction:jubaoAction];
            [actionSheet addAction:pingbiAction];
            [actionSheet addAction:pingbiSuoSsuoAction];
            [actionSheet addAction:quexiaoAction];
            [self presentViewController:actionSheet animated:YES completion:nil];
        
            }else{
                
            ZBloginViewController *loginVC = [[ZBloginViewController alloc] init];
            loginVC.loginType = YES;
            [self presentViewController:loginVC animated:YES completion:nil];
                
            }
    
    
}




/**
 在view中添加tableView
 */
- (void)creatTableView{
    //在view中添加tableView
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - ([UIApplication sharedApplication].statusBarFrame.size.height) ) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    //注册xib
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HNPDetailsCell class]) bundle:nil] forCellReuseIdentifier:IDOne];
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HNPCommentCell class]) bundle:nil] forCellReuseIdentifier:IDTwo];
    
    //tableViewCell自适应高度
    _tableView.estimatedRowHeight = 100;
    _tableView.rowHeight = UITableViewAutomaticDimension;
}

/**
 点击返回按钮进行跳转
 */
-(void)breakDeatail:(UIButton *)btn{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backPre" object:nil];
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.talk.list.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HNPDetailsCell *DetailsCell = [tableView dequeueReusableCellWithIdentifier:IDOne];
        //cell的选中样式
        DetailsCell.selectionStyle = UITableViewCellSelectionStyleNone;
        DetailsCell.XQModle = _dynamicModle;
        return DetailsCell;
    } else {
        HNPCommentCell *CommentCell = [tableView dequeueReusableCellWithIdentifier:IDTwo];
        CommentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        CommentCell.PLModel = self.talk.list[indexPath.row];
        return CommentCell;
    }
}

-(void)PLJson{
     NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.yysc.online"] sessionConfiguration:configuration];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    AFJSONResponseSerializer *response   = [AFJSONResponseSerializer serializer];
    response.removesKeysWithNullValues = YES;
    response.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/html",@"text/css",@"text/javascript", nil];
//    manager.responseSerializer = response;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"Referer"];
    // 设置超时时间
    
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 20.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
 
    //根据用户的talkId加载详情界面的评论
    [manager POST:@"/user/talk/getCommentList" parameters:@{@"_orderByDesc":@"publishTime",@"talkId": _dynamicModle.talkId} headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable result) {
        self.talk = [talkListModel mj_objectWithKeyValues:result[@"data"]];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}

#pragma mark - 判断是否登录
/**判断是否登录*/
- (void)determineWhetherToLogin
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/user.plist"];
//    NSString *path =[[NSBundle mainBundle] pathForResource:@"user.plist" ofType:nil];

    self.mineUserInfoModel = [ZBPersonModel mj_objectWithFile:path];
    if (self.mineUserInfoModel == nil) {
        self.login = NO;
    } else {
        self.login = YES;
    }
}


@end
