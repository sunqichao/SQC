//
//  ChongzhijiluViewController.h
//  SQC
//
//  Created by sun qichao on 14-1-8.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChongzhijiluViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

- (IBAction)dismissController:(id)sender;

@end
