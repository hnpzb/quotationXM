//
//  HNPCommentCell.m
//  touziyoudaoApp
//
//  Created by henanping on 2020/6/8.
//  Copyright © 2020 何南平. All rights reserved.
//

#import "HNPCommentCell.h"
#import <SDWebImage/SDWebImage.h>
#import "HNPDynamicUserModel.h"
#import "userModel.h"
#import <sys/utsname.h>

@interface HNPCommentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *PLHead;
@property (weak, nonatomic) IBOutlet UILabel *PLNickName;
@property (weak, nonatomic) IBOutlet UILabel *PLPublisTime;
@property (weak, nonatomic) IBOutlet UILabel *PLNeirong;
@property (weak, nonatomic) IBOutlet UIButton *PLDianzanBtn;


@end

@implementation HNPCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)CommentCellXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setPLModel:(ListModel *)PLModel{
    
    if (PLModel) {
        _PLModel = PLModel;
        [self.PLHead sd_setImageWithURL:[NSURL URLWithString:PLModel.user.head] placeholderImage:[UIImage imageNamed:@"EA7568E2877C9A3C061BD24261B3D4BB"]];
        self.PLNickName.text = PLModel.user.nickName;
        self.PLNeirong.text = PLModel.content;
        self.PLPublisTime.text = [HNPCommentCell timetampTostring:PLModel.publishTime.integerValue];
        
    }
    
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
//    matter.dateFormat =@"YYYY-MM-dd HH:mm";
    matter.dateFormat = @"YYYY-MM-dd";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[getTime intValue]];

      NSString *timeStr = [matter stringFromDate:date];
    return timeStr;
}

-(NSString *)time_timestampToString:(NSInteger)timestamp{
    
    NSDate *conformTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormat setDateFormat:@"HH:mm"];
    NSString *string = [dateFormat stringFromDate:conformTimesp];
    return string;
}

//点赞按钮
- (IBAction)commentDianzanBtn:(UIButton *)sender {
    self.PLDianzanBtn.selected = !self.PLDianzanBtn.selected;
    if (self.PLDianzanBtn.selected) {
        [self.PLDianzanBtn setBackgroundImage:[UIImage imageNamed:@"icon_dianzan"] forState:UIControlStateNormal];
    }else{
        [self.PLDianzanBtn setBackgroundImage:[UIImage imageNamed:@"icon_dianzan-1"] forState:UIControlStateNormal];
    }
}


@end
