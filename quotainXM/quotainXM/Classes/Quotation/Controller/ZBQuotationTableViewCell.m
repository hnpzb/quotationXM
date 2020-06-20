//
//  ZBQuotationTableViewCell.m
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/6.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import "ZBQuotationTableViewCell.h"


@interface ZBQuotationTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *contrctLabel;
@property (strong, nonatomic) IBOutlet UILabel *price_Label;

@property (strong, nonatomic) IBOutlet UILabel *dataChangeLabel;
@property (strong, nonatomic) IBOutlet UILabel *volumeLabel;

@end

@implementation ZBQuotationTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];

    [self setLabelProperties];
   
    
}

-(void)setLabelProperties{
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"泸铜1811" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:22/255.0 green:23/255.0 blue:31/255.0 alpha:1.0]}];
       self.contrctLabel.attributedText = string;
       
       

    NSMutableAttributedString *string_one = [[NSMutableAttributedString alloc] initWithString:@"48770" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:253/255.0 green:78/255.0 blue:73/255.0 alpha:1.0]}];
       self.price_Label.attributedText = string_one;
       

    NSMutableAttributedString *string_two = [[NSMutableAttributedString alloc] initWithString:@"-0.12" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:50/255.0 green:180/255.0 blue:150/255.0 alpha:1.0]}];
       self.dataChangeLabel.attributedText = string_two;
      

    NSMutableAttributedString *string_three = [[NSMutableAttributedString alloc] initWithString:@"891012" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:22/255.0 green:23/255.0 blue:31/255.0 alpha:1.0]}];
       self.volumeLabel.attributedText = string_three;
    
}

+(instancetype)quotation{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (void)setQutation:(ZBQuotationModal *)qutation{
    _qutation = qutation;
    self.contrctLabel.text = qutation.name;
    self.price_Label.text = qutation.price;
    self.dataChangeLabel.text =qutation.upPercent;
    self.volumeLabel.text = qutation.dealCount;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
