//
//  FengyunbangCell.h
//  SQC
//
//  Created by sun qichao on 14-1-9.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FengyunbangCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *pointsButton;

- (void)setDataSource:(id)dataSource withIndex:(int)index;

+ (FengyunbangCell *)cellFromNibNamed:(NSString *)nibName;

@end
