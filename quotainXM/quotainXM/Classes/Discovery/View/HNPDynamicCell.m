//
//  HNPDynamicCell.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/6.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPDynamicCell.h"
#import "HNPDetailsVC.h"
#import "HNPDynamicModle.h"
#import "HNPDynamicUserModel.h"
#import <SDWebImage/SDWebImage.h>
#import "HNPFollowModel.h"
#import "HNPUserCenterModel.h"
#import <sys/utsname.h>

@interface HNPDynamicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *DynamicImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *neirongLable;
@property (weak, nonatomic) IBOutlet UIImageView *neirongImageView;
@property (weak, nonatomic) IBOutlet UILabel *zanCountLable;
@property (weak, nonatomic) IBOutlet UILabel *commentCountLable;
@property (weak, nonatomic) IBOutlet UILabel *fabuTimeLable;

@property (weak, nonatomic) IBOutlet UIButton *dianzanBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureBottom;




@end

@implementation HNPDynamicCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //头像的圆形裁减区域
    self.DynamicImageView.layer.cornerRadius = 23.5;
    self.DynamicImageView.layer.masksToBounds = YES;
    
    self.neirongImageView.layer.cornerRadius = 7.5;
    self.neirongImageView.layer.masksToBounds = YES;

    self.DynamicImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *touchHead = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchImageView)];
    [self.DynamicImageView addGestureRecognizer:touchHead];


    

}

-(void)touchImageView
{
    if ([self.delegate respondsToSelector:@selector(dynamicCellDidImageClick:)]) {
        [self.delegate dynamicCellDidImageClick:self];
    }
}

+(instancetype)DynamicXib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setDTModel:(HNPDynamicModle *)DTModel{
    
    _DTModel = DTModel;
    //根据forwardCount判断关注图标是否隐藏
    if ([DTModel.forwardCount isEqualToString:@"1"]) {
        self.followBtn.hidden = YES;
    }else{
        self.followBtn.hidden = NO;
    }
    
    [self.DynamicImageView sd_setImageWithURL:[NSURL URLWithString:DTModel.user.head] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
    self.neirongLable.text = DTModel.content;
    self.nickName.text = DTModel.user.nickName;
    [self.neirongImageView sd_setImageWithURL:[NSURL URLWithString:DTModel.picture] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
    self.zanCountLable.text = DTModel.zanCount;
    self.commentCountLable.text = DTModel.commentCount;
    self.fabuTimeLable.text = DTModel.publishTime;
    
    
}

//重写关注的SET方法
- (void)setFollowModel:(HNPFollowModel *)FollowModel{
    
    _FollowModel = FollowModel;
    
    self.followBtn.hidden = YES;
    [self.DynamicImageView sd_setImageWithURL:[NSURL URLWithString:FollowModel.user.head] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
    self.neirongLable.text = FollowModel.content;
    self.commentCountLable.text = FollowModel.commentCount;
    [self.neirongImageView sd_setImageWithURL:[NSURL URLWithString:FollowModel.picture] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
    self.nickName.text = FollowModel.user.nickName;
    self.zanCountLable.text = FollowModel.zanCount;
    self.fabuTimeLable.text = [HNPDynamicCell timetampTostring:FollowModel.publishTime.integerValue];
//    NSLog(@"%@");
}

//重写用户中心动态的SET方法
-(void)setUserDynamicModle:(ListModel *)UserDynamicModle{
    
    _UserDynamicModle = UserDynamicModle;
    
    if (UserDynamicModle.talkId.picture != NULL) {
        self.neirongImageView.hidden = NO;
        [self.neirongImageView sd_setImageWithURL:[NSURL URLWithString:UserDynamicModle.talkId.picture] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
        self.pictureHeight.constant = 89;
        self.pictureBottom.constant = 18;
    }else{
        self.neirongImageView.hidden = YES;
        self.pictureHeight.constant = 0;
        self.pictureBottom.constant = 0;
    }
    self.neirongLable.text = UserDynamicModle.content;
    self.commentCountLable.text = UserDynamicModle.user.followCount.stringValue;
    self.zanCountLable.text = UserDynamicModle.user.fansCount.stringValue;
    self.fabuTimeLable.text = [HNPDynamicCell timetampTostring:UserDynamicModle.publishTime.integerValue];
//    self.neirongLable.numberOfLines = 0;
    
}

//重写用户中心用户动态的头像和昵称方法
-(void)setAllDynamicModel:(HNPDynamicModle *)allDynamicModel{
    
    _allDynamicModel = allDynamicModel;
    [self.DynamicImageView sd_setImageWithURL:[NSURL URLWithString:allDynamicModel.user.head] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
    self.nickName.text = allDynamicModel.user.nickName;
    
}

//时间戳
+(NSString *)timetampTostring:(long)timestamp{
    
    NSString *tempTime =[[NSNumber numberWithLong:timestamp] stringValue];
    NSMutableString *getTime = [NSMutableString stringWithFormat:@"%@",tempTime];

      //    NSMutableString *getTime = @"1461896616000";
     struct utsname systemInfo;
     uname(&systemInfo);

     [getTime deleteCharactersInRange:NSMakeRange(10,3)];
     NSDateFormatter *matter = [[NSDateFormatter alloc]init];
    matter.dateFormat =@"YYYY-MM-dd HH:mm";
//    matter.dateFormat = @"YYYY-MM-dd";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[getTime intValue]];

      NSString *timeStr = [matter stringFromDate:date];
    return timeStr;
}

//点赞数量加1减1
- (IBAction)dianzanBtn:(UIButton *)sender {
    self.dianzanBtn.selected = !self.dianzanBtn.selected;
            if (self.dianzanBtn.selected) {
                [self.dianzanBtn setBackgroundImage:[UIImage imageNamed:@"icon_dianzan"] forState:UIControlStateNormal];
                self.zanCountLable.text = [NSString stringWithFormat:@"%ld",self.zanCountLable.text.integerValue + 1];
            }else{
                [self.dianzanBtn setBackgroundImage:[UIImage imageNamed:@"icon_dianzan-1"] forState:UIControlStateNormal];
                self.zanCountLable.text = [NSString stringWithFormat:@"%ld",self.zanCountLable.text.integerValue - 1];
            }
}


@end
