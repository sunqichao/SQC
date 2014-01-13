//
//  ChongZhiJILuCell.h
//  SQC
//
//  Created by sun qichao on 14-1-9.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChongZhiJILuCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (void)setDataSource:(id)data;

+ (ChongZhiJILuCell *)cellFromNibNamed:(NSString *)nibName;

@end
