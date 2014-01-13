//
//  FeedBackViewController.m
//  SQC
//
//  Created by sun qichao on 14-1-8.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()

@end

@implementation FeedBackViewController

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_textview becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissController:(id)sender {
    [_textview resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)submitFeedback:(id)sender {
    [_textview resignFirstResponder];
    if (_textview.text.length>2) {
        [SQCAPI sendFeedbackInfo:_textview.text withBlock:^(BOOL isRight) {
            if (isRight) {
                [SVProgressHUD showSuccessWithStatus:@"反馈成功！我们会更努力得加班来改进不足。" duration:2.0f];
                [self dismissViewControllerAnimated:YES completion:nil];

            }else
            {
                [SVProgressHUD showSuccessWithStatus:@"亲！可能是网络原因导致发送错误！亲！" duration:2.0f];

            }
        }];

    }
}

@end
