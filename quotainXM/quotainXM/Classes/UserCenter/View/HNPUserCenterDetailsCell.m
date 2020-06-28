//
//  HNPUserCenterDetailsCell.m
//  quotainXM
//
//  Created by henanping on 2020/6/24.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "HNPUserCenterDetailsCell.h"
#import <SDWebImage/SDWebImage.h>
#import <sys/utsname.h>

@interface HNPUserCenterDetailsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *UcDynamicDetailsHead;
@property (weak, nonatomic) IBOutlet UILabel *UcDynamicDetailsNickname;
@property (weak, nonatomic) IBOutlet UILabel *UcDynamicDetailsneirong;
@property (weak, nonatomic) IBOutlet UILabel *UcDynamicDetailsZanCount;
@property (weak, nonatomic) IBOutlet UILabel *UcDynamicDetailsCommentCount;
@property (weak, nonatomic) IBOutlet UILabel *UcDynamicDetailsTime;
@property (weak, nonatomic) IBOutlet UIImageView *UcDymamicDetailsPicture;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureBottom;

@end

@implementation HNPUserCenterDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    [self.UcDynamicDetailsHead sd_setImageWithURL:[NSURL URLWithString:self.Head] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
//    self.UcDynamicDetailsNickname.text = self.nickname;
    self.UcDynamicDetailsHead.layer.cornerRadius = 15;
    self.UcDynamicDetailsHead.layer.masksToBounds = YES;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setUcDymamicModel:(ListModel *)UcDymamicModel{
    _UcDymamicModel = UcDymamicModel;
    if (UcDymamicModel.talkId.picture != NULL) {
        self.UcDymamicDetailsPicture.hidden = NO;
        [self.UcDymamicDetailsPicture sd_setImageWithURL:[NSURL URLWithString:UcDymamicModel.talkId.picture] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
        self.pictureHeight.constant = 255;
        self.pictureBottom.constant = 30;
    }else{
        self.UcDymamicDetailsPicture.hidden = YES;
        self.pictureHeight.constant = 0;
        self.pictureBottom.constant = 0;
    }
    
    [self.UcDynamicDetailsHead sd_setImageWithURL:[NSURL URLWithString:self.Head] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
    self.UcDynamicDetailsNickname.text = self.nickname;
    self.UcDynamicDetailsneirong.text = UcDymamicModel.content;
    self.UcDynamicDetailsZanCount.text = UcDymamicModel.user.fansCount.stringValue;
    self.UcDynamicDetailsCommentCount.text = UcDymamicModel.user.followCount.stringValue;
    self.UcDynamicDetailsTime.text = [HNPUserCenterDetailsCell timetampTostring:UcDymamicModel.publishTime.integerValue];
    
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









@end
