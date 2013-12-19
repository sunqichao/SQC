//
//  SQCRegisterViewController.m
//  SQC
//
//  Created by sun qichao on 13-12-19.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "SQCRegisterViewController.h"

@interface SQCRegisterViewController ()

@end

@implementation SQCRegisterViewController

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

- (IBAction)dismissRegister:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenRegisterViewNotification" object:nil];

}
@end
