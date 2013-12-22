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
    
    self.pointsLabel.text = [SQCAPI getCurrentPoints];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) motionBegan:(UIEventSubtype)motion
           withEvent:(UIEvent*)event
{
    
    //检测到摇动
    NSLog(@"yao");
    
    NSString *yaoyiyaotime = [[NSUserDefaults standardUserDefaults] objectForKey:YaoYiYaoKey];
    
    NSDate *date = [NSDate date];
    
    NSString *dateString = [date description];
    
    NSRange rangeSpace = [dateString rangeOfString:@" "];
    
    dateString = [[dateString substringFromIndex:0] substringToIndex:rangeSpace.location];
    
    NSArray *array = [dateString componentsSeparatedByString:@"-"];
    
    NSString *day = [array objectAtIndex:2];
    
    if (![day isEqualToString:yaoyiyaotime]) {
        NSLog(@"yao yi yao");
        [SVProgressHUD showSuccessWithStatus:yaoyiyaoAlertMessage duration:2.0f];
        
        int loacl = [[[NSUserDefaults standardUserDefaults] objectForKey:localPointsKey] intValue];
        loacl+=10;
        
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",loacl] forKey:localPointsKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[NSUserDefaults standardUserDefaults] setObject:day forKey:YaoYiYaoKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _pointsLabel.text = [SQCAPI getCurrentPoints];
            
        });
        
    }else
    {
        NSLog(@"yi tian yao yi ci");
        [SVProgressHUD showSuccessWithStatus:yaoyiyaoAlertMessageFailed duration:2.0f];
        
    }
    
}


@end
