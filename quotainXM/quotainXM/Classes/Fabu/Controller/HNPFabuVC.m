//
//  HNPFabuVC.m
//  quotainXM
//
//  Created by henanping on 2020/6/16.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPFabuVC.h"
#import "SelectPhotoManager.h"

@interface HNPFabuVC ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,selectPhotoDelegate>

//点开相册添加的图片
@property (strong, nonatomic) IBOutlet UIImageView *addImageView;
@property (nonatomic,strong)SelectPhotoManager *photoManger;
//打开相机按钮属性
@property (weak, nonatomic) IBOutlet UIButton *openCaremaBtn;
@property (strong, nonatomic) IBOutlet UITextView *text_FV;
@property(nonatomic,strong)NSString *saveUrl;

@end

@implementation HNPFabuVC

- (void)viewDidLoad {
    [super viewDidLoad];

    //调用相机
    [self setphotoImage];
    //轻扫返回
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView)];
    [self.view addGestureRecognizer:swipe];
    //轻扫删除图片
    _addImageView.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *deleteImageView = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDeleteView)];
    [self.addImageView addGestureRecognizer:deleteImageView];
//    [HNPFabuVC getNowTimestamp];
}

//返回上一界面
- (IBAction)backBtn:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)swipeView{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

//轻扫删除图片
-(void)swipeDeleteView{
    _addImageView.hidden = YES;
}

//打开相册
- (IBAction)pickPhotoBtn:(id)sender {
    UIImagePickerController *pickVC = [[UIImagePickerController alloc]init];
    pickVC.delegate = self;

    [self presentViewController:pickVC animated:YES completion:nil];
}
//获取选择的图片
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *pickImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    _addImageView.image = pickImage;
}

//打开相机
//- (IBAction)openCamera:(id)sender {
    /*
    UIImagePickerController *pickVC = [[UIImagePickerController alloc] init];
            pickVC.delegate = self;
            pickVC.allowsEditing = YES;
            
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            
            UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"从相机拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
                    
                    
                    pickVC.sourceType = UIImagePickerControllerSourceTypeCamera;
                    [self presentViewController:pickVC animated:YES completion:nil];
                    
                }
            }];
            
            UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                pickVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:pickVC animated:YES completion:nil];
            }];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击了取消");
            }];
            
            [actionSheet addAction:cameraAction];
            [actionSheet addAction:photoAction];
            [actionSheet addAction:cancelAction];
            
            [self presentViewController:actionSheet animated:YES completion:nil];
        }
       
    //获取选择的图片
        -(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
            [picker dismissViewControllerAnimated:YES completion:nil];
            UIImage *pickImage = [info objectForKey:UIImagePickerControllerOriginalImage];
            _addImageView.image = pickImage;
        }
    //从相机或者相册界面弹出
//        - (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
//            [picker dismissViewControllerAnimated:YES completion:nil];

*/
//}

//添加相机的点击手势
- (void)setphotoImage{
    self.openCaremaBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(photoClick:)];
    [self.openCaremaBtn addGestureRecognizer:tap];
    UIImage *img = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"photoView"]];
    if (img) {
        self.addImageView.image = img;
    }
}

- (void)photoClick:(UITapGestureRecognizer *)recognizer{

   if (!_photoManger) {
       _photoManger = [[SelectPhotoManager alloc]init];
       _photoManger.delegate = self;
   }
      [_photoManger startSelectPhotoWithImageName:@"选择头像"];
           __weak typeof (self)mySelf = self;
           _photoManger.successHandle = ^(SelectPhotoManager *manager, UIImage *image) {
               mySelf.addImageView.image = image;
           };
}

- (IBAction)fabuClick:(id)sender {
    [self ZBbeginFabu];
//    [self uoLoadPicture];
}

-(void)ZBbeginFabu{
    
    NSInteger curTimeTap = [HNPFabuVC getNowTimestamp];
    
    NSMutableDictionary *par = [[NSMutableDictionary alloc]init];
    [par setObject:self.userID forKey:@"userId"];
    [par setObject:@"false" forKey:@"displayBig"];
//    [par setObject:@"true" forKey:@"enable"];
//    [par setObject:[NSString stringWithFormat:@"%ld",curTimeTap] forKey:@"publishTime"];
    [par setObject:_text_FV.text forKey:@"content"];
    [par setObject:@"" forKey:@"video"];
    [par setObject:@"" forKey:@"picture"];
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   
    [manager POST:@"http://api.yysc.online/user/talk/publishTalk" parameters:par headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        NSDictionary *data = responseObject;
        NSLog(@"%@",data);
        NSString *success = [NSString stringWithFormat:@"%@",data[@"code"]];
        if ([success isEqualToString:@"1"]) {
            [MBProgressHUD showMessage:@"发布成功..."];
            
            //延时执行代码
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 [MBProgressHUD hideHUD];
            
                });
        }else{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"发布失败"];
        }
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"failure");
        }];
        
    
}

#pragma mark - 获取当前时间的 时间戳

+(NSInteger)getNowTimestamp{

 

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

    [formatter setDateStyle:NSDateFormatterMediumStyle];

    [formatter setTimeStyle:NSDateFormatterShortStyle];

    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制

    //设置时区,这个对于时间的处理有时很重要

    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];

    [formatter setTimeZone:timeZone];

    NSDate *datenow = [NSDate date];//现在时间

    

//    NSLog(@"设备当前的时间:%@",[formatter stringFromDate:datenow]);

    //时间转时间戳的方法:

   

    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];

    

//    NSLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值

    

    return timeSp;

}


-(void)uoLoadPicture{
    
    NSDictionary *dict = @{
        @"file" : self.addImageView.image
    };
    NSData *imageData = UIImageJPEGRepresentation(self.addImageView.image, .1);
//    UIImagePNGRepresentation(self.addImageView.image);
//    self.addImageView.image
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    AFHTTPResponseSerializer *responseSer = [AFHTTPResponseSerializer serializer];
      responseSer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
      manager.responseSerializer = responseSer;
    [manager POST:@"http://image.yysc.online/upload" parameters:dict headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
//        NSDateFormatter *formater = [[NSDateFormatter alloc] init];
//        formater.dateFormat = @"yyyy-MM-dd HH:mmm:ss";
//        NSString *fileName = [NSString stringWithFormat:@"%.png",[formater stringFromDate:[NSDate date]]];
        [formData appendPartWithFileData:imageData name:@"file" fileName:@"iconImage" mimeType:@"image/png"];
           
       } progress:^(NSProgress * _Nonnull uploadProgress) {
           //打印上传进度
           CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
           DLog(@"%.2lf%%", progress);
       } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           //请求成功
           DLog(@"请求成功：%@",responseObject);
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           //请求失败
           DLog(@"请求失败：%@",error);
       }];
    
    
}

/*
 //头像点击事件
 -(void)tapClick:(UITapGestureRecognizer *)recognizer{
     
     if (!_photoManager) {
         _photoManager =[[ZYSelectPhotoManager alloc]init];
     }
     [_photoManager startSelectPhotoWithImageName:@"选择头像"];
     __weak typeof(self)mySelf=self;
     //选取照片成功
     _photoManager.successHandle=^(ZYSelectPhotoManager *manager,UIImage *image){
             NSDictionary *dict = @{
                 @"file" : self.headerImage.image
             };
             [NetworkTool.shared postReturnString:@"http://image.yysc.online/upload" fileName:@"headerImage" image:self.headerImage.image viewcontroller:nil params:dict  success:^(id _Nonnull response) {
                 self.saveURL = response;
                         //上传图片成功后才publishMessage
         //                [self publishMessage];
             } failture:^(NSError * _Nonnull error) {
         //        [Toast makeText:weakSelf.view Message:@"上传图片失败" afterHideTime:DELAYTiME];
                  [MBProgressHUD showError:@"上传图片失败"];
             }];
         
         mySelf.headerImage.image = image;
         //保存到本地
         NSData *data = UIImagePNGRepresentation(image);
         [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"headerImage"];
     };
 }
 */

@end
