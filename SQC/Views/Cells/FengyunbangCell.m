//
//  FengyunbangCell.m
//  SQC
//
//  Created by sun qichao on 14-1-9.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import "FengyunbangCell.h"

@implementation FengyunbangCell

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

- (void)layoutSubviews
{
    [super layoutSubviews];
    _pointsButton.layer.cornerRadius = 10.0f;
    
}

- (void)setDataSource:(id)dataSource withIndex:(int)index
{
    PFObject *diction = (PFObject *)dataSource;
    
    _numberLabel.text = [NSString stringWithFormat:@"%d",index+1];
    
    _nameLabel.text = [NSString stringWithFormat:@"%@",[diction objectForKey:FengyunKeyName]];
    
    [_pointsButton setTitle:[NSString stringWithFormat:@"%@",[diction objectForKey:FengyunKeyPoints]] forState:UIControlStateNormal];
}

+ (FengyunbangCell *)cellFromNibNamed:(NSString *)nibName
{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    FengyunbangCell *customCell = nil;
    NSObject* nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil)
    {
        if ([nibItem isKindOfClass:[FengyunbangCell class]])
        {
            customCell = (FengyunbangCell *)nibItem;
            break;
        }
    }
    return customCell;
}

@end
