//
//  PersonalInfoViewController.h
//  SQC
//
//  Created by sun qichao on 14-1-8.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalInfoViewController : UIViewController<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *headerimage;

@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *currentPoints;
@property (weak, nonatomic) IBOutlet UILabel *totalHuafei;
@property (weak, nonatomic) IBOutlet UILabel *totalZhifubao;

- (IBAction)dismissController:(id)sender;

- (IBAction)changeHeaderImage:(id)sender;

@end
