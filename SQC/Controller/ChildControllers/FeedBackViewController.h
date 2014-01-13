//
//  FeedBackViewController.h
//  SQC
//
//  Created by sun qichao on 14-1-8.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedBackViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textview;
- (IBAction)dismissController:(id)sender;
- (IBAction)submitFeedback:(id)sender;

@end
