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
    self.input.keyboardType = UIKeyboardTypeNumberPad;
    
    self.changButton.layer.cornerRadius = 65.f;
    
    self.pointsButton.layer.cornerRadius = 65.f;
    
    self.yaoyiyao.layer.cornerRadius = 27.f;
    
    //更新界面得通知
    [self addUpdateViewsNotification];
    
    UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:pan];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(youmipointsGotted:) name:kYouMiPointsManagerRecivedPointsNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.nameLabel.text = [CoreDataManager getCurrentUserName];
    self.pointsLabel.text = [CoreDataManager getCurrentPoints];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissKeyboard:(UIPanGestureRecognizer *)sender
{
    [_input resignFirstResponder];
    
}

#pragma mark - 充值成功后 刷新分数

- (void)addUpdateViewsNotification
{

    
    [NSNotificationCenter.defaultCenter addObserverForName:@"refreshPoints"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         NSLog(@"refreshPoints ********");
         
         dispatch_async(dispatch_get_main_queue(), ^{
             self.pointsLabel.text = [CoreDataManager getCurrentPoints];
             [SQCAPI sendAllUserInfomations];
             [self performSelector:@selector(successWithMoney) withObject:nil afterDelay:2.0];
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshPoints" object:nil];
}

- (void)successWithMoney
{
    [SVProgressHUD showSuccessWithStatus:rechargeSuccess duration:2.0f];

}

#pragma mark - 得到有米积分的提示

- (void)youmipointsGotted:(NSNotification *)notification {
    
    
    NSDictionary *dict = [notification userInfo];
    NSNumber *freshPoints = [dict objectForKey:kYouMiPointsManagerFreshPointsKey];
    // freshPoints的积分不应该拿来使用,积分已经被YouMiSDK保存了, 只是用于告知一下用户, 可以通过 [YouMiPointsManager spendPoints:]来使用积分。
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通知" message:[NSString stringWithFormat:@"获得%@个小积分", freshPoints] delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
    [alert show];
    
    _pointsLabel.text = [NSString stringWithFormat:@"积分：%@",[CoreDataManager getCurrentPoints]];

}

#pragma mark - 摇一摇

- (void) motionBegan:(UIEventSubtype)motion
           withEvent:(UIEvent*)event
{
    
    //检测到摇动
    NSLog(@"yao");
    
    NSString *yaoyiyaotime = [CoreDataManager getCurrentYaoYiYaoPointsDate];
    
    NSString *dateString = [[SQC_StringUtility getCurrentDate] description];
    
    NSRange rangeSpace = [dateString rangeOfString:@" "];
    
    dateString = [[dateString substringFromIndex:0] substringToIndex:rangeSpace.location];
    
    NSArray *array = [dateString componentsSeparatedByString:@"-"];
    
    NSString *day = [array objectAtIndex:2];
    
    if (![day isEqualToString:yaoyiyaotime]) {
        NSLog(@"yao yi yao");
        NSString *yaoyiyaopoints = [SQCAPI getYaoYiYaoPoints];
        
        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:yaoyiyaoAlertMessage,yaoyiyaopoints] duration:2.0f];
        
        //设置摇一摇的最后更新时间
        [CoreDataManager setYaoYiYaoPointsDate:day];
        
        //设置摇一摇的分数
        [CoreDataManager setYaoYiYaoPoints:yaoyiyaopoints];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _pointsLabel.text = [NSString stringWithFormat:@"%@",[CoreDataManager getCurrentPoints]];
            
        });
        
    }else
    {
        NSLog(@"yi tian yao yi ci");
        [SVProgressHUD showSuccessWithStatus:yaoyiyaoAlertMessageFailed duration:2.0f];
        
    }
    
}

#pragma mark - 提交话费充值一条记录

- (IBAction)exchangeHuaFei:(id)sender {

    //检查积分是否大于充值金额
    if ([SQCAPI isEnoughPointsWith:(_moneyItems.selectedSegmentIndex+1)*10]) {
        
        //判断手机号是否正确
        if ([SQC_StringUtility mobileJudging:_input.text]) {
            
            [_input resignFirstResponder];
            
            [SQCAPI sendHuafeiMoney:(_moneyItems.selectedSegmentIndex+1)*10 number:_input.text];
            
        }else
        {
            [SVProgressHUD showSuccessWithStatus:@"亲，请输入正确的手机号" duration:2.0f];

        }
        
    }else
    {
        [SVProgressHUD showSuccessWithStatus:pointsNotEnough duration:2.0f];
    }

    
}

#pragma mark - 显示积分墙

- (IBAction)showWall:(id)sender {
    
    [SQCAPI showPointsWall];
    
    
}
@end
