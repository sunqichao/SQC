//
//  DetailViewController.h
//  SQC
//
//  Created by sun qichao on 14-1-9.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

- (IBAction)dismissController:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@property (nonatomic ,copy) NSString *content;

@end
