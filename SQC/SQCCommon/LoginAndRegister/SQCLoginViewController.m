//
//  SQCLoginViewController.m
//  SQC
//
//  Created by sun qichao on 13-12-19.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "SQCLoginViewController.h"

@interface SQCLoginViewController ()

@end

@implementation SQCLoginViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)appearRegisterView:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearRegisterViewNotification" object:nil];

}

- (IBAction)dismissLogin:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenLoginViewNotification" object:nil];

}
@end
