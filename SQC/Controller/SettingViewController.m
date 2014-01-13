//
//  SettingViewController.m
//  SQC
//
//  Created by sun qichao on 13-12-23.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "SettingViewController.h"
#import "iRate.h"
#import "Harpy.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _chongzhijilu.layer.cornerRadius = settingCornerRadius;
    _jifenfengyunbang.layer.cornerRadius = settingCornerRadius;
    _jifenjilu.layer.cornerRadius = settingCornerRadius;
    _myinfomation.layer.cornerRadius = settingCornerRadius;
    _help.layer.cornerRadius = settingCornerRadius;
    _suport.layer.cornerRadius = settingCornerRadius;
    _checkupadte.layer.cornerRadius = settingCornerRadius;
    _feedback.layer.cornerRadius = settingCornerRadius;
    _connect.layer.cornerRadius = settingCornerRadius;

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 去appstore评分

- (IBAction)gotoAppstoreIRate:(id)sender {
    
    [[iRate sharedInstance] promptForRating];
    
}

- (IBAction)checkUpdate:(id)sender {
    
    [[Harpy sharedInstance] checkVersion];

}


@end
