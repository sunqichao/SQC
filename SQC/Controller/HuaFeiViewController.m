//
//  HuaFeiViewController.m
//  SQC
//
//  Created by sun qichao on 13-12-20.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "HuaFeiViewController.h"

@interface HuaFeiViewController ()

@end

@implementation HuaFeiViewController

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
    
    self.changButton.layer.cornerRadius = 60.f;
    
    self.pointsButton.layer.cornerRadius = 60.f;
    
    self.yaoyiyao.layer.cornerRadius = 35.f;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
