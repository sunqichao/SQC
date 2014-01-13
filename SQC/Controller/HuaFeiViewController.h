//
//  HuaFeiViewController.h
//  SQC
//
//  Created by sun qichao on 13-12-20.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HuaFeiViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIButton *changButton;

@property (weak, nonatomic) IBOutlet UIButton *pointsButton;

@property (weak, nonatomic) IBOutlet UIImageView *yaoyiyao;

@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *moneyItems;

@property (weak, nonatomic) IBOutlet UITextField *input;


- (IBAction)exchangeHuaFei:(id)sender;

- (IBAction)showWall:(id)sender;

@end
