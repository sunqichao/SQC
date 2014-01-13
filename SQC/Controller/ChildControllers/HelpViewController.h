//
//  HelpViewController.h
//  SQC
//
//  Created by sun qichao on 14-1-10.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (weak, nonatomic) IBOutlet UIButton *dismisscontroller;
- (IBAction)dismisscontroller:(id)sender;

@end
