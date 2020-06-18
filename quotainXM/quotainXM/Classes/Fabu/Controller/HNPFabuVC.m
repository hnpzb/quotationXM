//
//  HNPFabuVC.m
//  quotainXM
//
//  Created by henanping on 2020/6/16.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPFabuVC.h"

@interface HNPFabuVC ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *addImageView;
@property (strong, nonatomic) IBOutlet UITextView *text_FV;

@end

@implementation HNPFabuVC

- (void)viewDidLoad {
    [super viewDidLoad];

  
    //轻扫返回
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView)];
    [self.view addGestureRecognizer:swipe];
//    轻扫删除图片
    _addImageView.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *deleteImageView = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDeleteView)];
    [self.addImageView addGestureRecognizer:deleteImageView];
}

//返回上一界面
- (IBAction)backBtn:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)swipeView{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:self];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)swipeDeleteView{
    _addImageView.hidden = YES;
}

//打开相册
- (IBAction)pickPhotoBtn:(id)sender {
    UIImagePickerController *pickVC = [[UIImagePickerController alloc]init];
    pickVC.delegate = self;
    
    [self presentViewController:pickVC animated:YES completion:nil];
}

//点击相册的图片给ImageView赋值
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    
    UIImage *pickImage = info[UIImagePickerControllerOriginalImage];
    _addImageView.hidden = NO;
    _addImageView.image = pickImage;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)fabuClick:(id)sender {
    NSLog(@"%@",_text_FV.text);
}



@end
