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
@property (weak, nonatomic) IBOutlet UIImageView *addImageView;
@property (nonatomic,strong)SelectPhotoManager *photoManger;
//打开相机按钮属性
@property (weak, nonatomic) IBOutlet UIButton *openCaremaBtn;
@property (strong, nonatomic) IBOutlet UITextView *text_FV;

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
    NSLog(@"%@",_text_FV.text);
}



@end
