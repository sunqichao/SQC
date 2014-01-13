//
//  ChongZhiJILuCell.m
//  SQC
//
//  Created by sun qichao on 14-1-9.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import "ChongZhiJILuCell.h"

@implementation ChongZhiJILuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataSource:(id)data
{
    PFObject *diction = (PFObject *)data;
    NSString *account = [diction objectForKey:@"phone"];
    if (!account) {
        account = [diction objectForKey:@"zhiFuBao"];
    }
    _nameLabel.text = account;
    
    _moneyLabel.text = [NSString stringWithFormat:@"%@块钱",[diction objectForKey:@"money"]];

    _statusLabel.text = [NSString stringWithFormat:@"%@",[diction objectForKey:@"isOK"]];
    
    _timeLabel.text = [NSString stringWithFormat:@"%@",diction.createdAt];
}

+ (ChongZhiJILuCell *)cellFromNibNamed:(NSString *)nibName
{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    ChongZhiJILuCell *customCell = nil;
    NSObject* nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil)
    {
        if ([nibItem isKindOfClass:[ChongZhiJILuCell class]])
        {
            customCell = (ChongZhiJILuCell *)nibItem;
            break;
        }
    }
    return customCell;
}
@end
