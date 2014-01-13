//
//  SettingViewController.h
//  SQC
//
//  Created by sun qichao on 13-12-23.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *chongzhijilu;

@property (weak, nonatomic) IBOutlet UIButton *jifenfengyunbang;

@property (weak, nonatomic) IBOutlet UIButton *jifenjilu;

@property (weak, nonatomic) IBOutlet UIButton *myinfomation;

@property (weak, nonatomic) IBOutlet UIButton *help;

@property (weak, nonatomic) IBOutlet UIButton *suport;

@property (weak, nonatomic) IBOutlet UIButton *checkupadte;

@property (weak, nonatomic) IBOutlet UIButton *feedback;

@property (weak, nonatomic) IBOutlet UIButton *connect;


- (IBAction)gotoAppstoreIRate:(id)sender;


- (IBAction)checkUpdate:(id)sender;



@end
