//
//  ZBQuotationTableViewCell.h
//  quotationAPP
//
//  Created by 朱彬 on 2020/6/6.
//  Copyright © 2020 朱彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBQuotationModal.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZBQuotationTableViewCell : UITableViewCell

@property(nonatomic,strong)ZBQuotationModal *qutation;

+(instancetype)quotation;

@end

NS_ASSUME_NONNULL_END
