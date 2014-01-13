//
//  SQCAPI.m
//  SQC
//
//  Created by sunqichao on 13-12-22.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "SQCAPI.h"
#import "UserInfo.h"
#import "UIImage+ResizeAdditions.h"
@implementation SQCAPI



#pragma mark - 显示积分墙

+ (void)showPointsWall
{
    
    [YouMiWall showOffers:YES didShowBlock:^{
        NSLog(@"有米积分墙已显示");
    } didDismissBlock:^{
        NSLog(@"有米积分墙已退出");
    }];
    
}


#pragma mark - 注册 parse接口

+ (void)signUpWithName:(NSString *)name
{
    PFUser *user = [PFUser user];
    user.username = name;
    user.password = @"123456";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"zhu ce cheng gong");
            [CoreDataManager setSignUpSuccessed:@"ok"];
        }else
        {
            NSLog(@"zhu ce shi bai error %@",error);
        }
        
    }];

}


#pragma mark - 发送用户信息到服务端

+ (void)sendAllUserInfomations
{
    PFUser *user = [PFUser currentUser];
    user[@"currentPoints"] = [CoreDataManager getCurrentPoints];
    user[@"totalChangeMoney"] = [CoreDataManager getTotalMoney];
    user[@"youmiPoints"] = [CoreDataManager getCurrentYouMiPoints];
    user[@"yaoyiyaoDate"] = [CoreDataManager getCurrentYaoYiYaoPointsDate];
    user[@"yaoyiyaoPoints"] = [CoreDataManager getCurrentYaoYiYaoPoints];
    user[@"signUP"] = [CoreDataManager getSignUpSuccessed];
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"send all information succeed");
        }else
        {
            NSLog(@"send all information faild");
        }
    }];
    
}

+ (void)sendHuafeiMoney:(int)money number:(NSString *)phoneNumber
{
    NSString *userName = [CoreDataManager getCurrentUserName];
    NSString *moneystring = [NSString stringWithFormat:@"%d",money];
    NSString *phone = phoneNumber;
    NSString *currentPoints = [CoreDataManager getCurrentPoints];
    NSString *yaoyiyaoPoints = [CoreDataManager getCurrentYaoYiYaoPoints] ;
    NSString *youmiPoints = [CoreDataManager getCurrentYouMiPoints] ;
    PFObject *huafei = [PFObject objectWithClassName:@"HuaFei"];
    huafei[@"phone"] = phone;
    huafei[@"money"] = moneystring;
    huafei[@"userName"] = userName;
    huafei[@"currentPoints"] = currentPoints;
    huafei[@"yaoyiyaoPoints"] = yaoyiyaoPoints;
    huafei[@"youmiPoints"] = youmiPoints;
    huafei[@"isOK"] = @"处理中";
    huafei[@"users"] = [PFUser currentUser];
    [huafei saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"succeed");
            int spend = money*exchangepointsToMoney;    //算出消费的积分
            
            //消费有米的积分   不足积分的时候
            if (![YouMiPointsManager spendPoints:spend]) {
                int youmi = [[CoreDataManager getCurrentYouMiPoints] intValue];
                int yaoyiyao = [[CoreDataManager getCurrentPoints] intValue]-youmi;
                [CoreDataManager spendYaoYiYaoPoints:[NSString stringWithFormat:@"%d",yaoyiyao]];
            }
            
            [CoreDataManager setTotalMoney:moneystring];         //累计兑换的钱数到coredata
            [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshPoints" object:nil userInfo:nil];
           
            [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"消费%D积分", spend] duration:2.0f];
            
            
        }else
        {
            NSLog(@"%@",error);
        }
    }];
}

+ (void)sendZhifubaoMoney:(int)money account:(NSString *)account
{
    NSString *userName = [CoreDataManager getCurrentUserName];
    NSString *moneystring = [NSString stringWithFormat:@"%d",money];
    NSString *zhifubao = account;
    NSString *currentPoints = [NSString stringWithFormat:@"%@",[CoreDataManager getCurrentPoints]];
    NSString *yaoyiyaoPoints = [CoreDataManager getCurrentYaoYiYaoPoints] ;
    NSString *youmiPoints = [CoreDataManager getCurrentYouMiPoints] ;
    PFObject *huafei = [PFObject objectWithClassName:@"ZhiFuBao"];
    huafei[@"zhiFuBao"] = zhifubao;
    huafei[@"money"] = moneystring;
    huafei[@"userName"] = userName;
    huafei[@"currentPoints"] = currentPoints;
    huafei[@"yaoyiyaoPoints"] = yaoyiyaoPoints;
    huafei[@"youmiPoints"] = youmiPoints;
    huafei[@"isOK"] = @"处理中";
    huafei[@"users"] = [PFUser currentUser];
    [huafei saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"succeed");
            int spend = money*exchangepointsToMoney;    //算出消费的积分
            
            //消费有米的积分   不足积分的时候
            if (![YouMiPointsManager spendPoints:spend]) {
                int youmi = [[CoreDataManager getCurrentYouMiPoints] intValue];
                int yaoyiyao = [[CoreDataManager getCurrentPoints] intValue]-youmi;
                [CoreDataManager spendYaoYiYaoPoints:[NSString stringWithFormat:@"%d",yaoyiyao]];
            }
            
            [CoreDataManager setTotalMoney:moneystring];         //累计兑换的钱数到coredata
            [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshPoints" object:nil userInfo:nil];
            
            [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"消费%D积分", spend] duration:2.0f];

        }else
        {
            NSLog(@"%@",error);
        }
    }];
    
}


#pragma mark - 判断当前积分是否达到兑换标准

+ (BOOL)isEnoughPointsWith:(int)money
{
    BOOL isEnough = NO;
    
    int targetPoints = money*exchangepointsToMoney;
    
    int currentPoints = [[CoreDataManager getCurrentPoints] intValue];
    
    if (targetPoints<currentPoints) {
        isEnough = YES;
    }
    
    return isEnough;
}

#pragma mark - 获取摇一摇积分

+ (NSString *)getYaoYiYaoPoints
{
    PFQuery *query = [PFQuery queryWithClassName:@"Setting"];
    
    NSArray *setting = [query findObjects];
    
    PFObject *object = [setting objectAtIndex:0];
    
    NSString *points;
    
    if (object[@"yaoyiyaoPoints"]) {
       points = [NSString stringWithFormat:@"%@",object[@"yaoyiyaoPoints"]];

    }else
    {
        points = @"10";
    }
    
    return points;
}

#pragma mark - 设置和获取用户头像

+ (void)setUserHeaderImage:(UIImage *)header
{
    UIImage *image = (UIImage *)header;
    
    UIImage *mediumImage = [image thumbnailImage:280 transparentBorder:0 cornerRadius:0 interpolationQuality:kCGInterpolationHigh];
    
    NSData *mediumImageData = UIImageJPEGRepresentation(mediumImage, 0.5); // using JPEG for larger pictures
    
    if (mediumImageData.length > 0) {
        NSLog(@"Uploading Medium Profile Picture");
        PFFile *fileMediumImage = [PFFile fileWithData:mediumImageData];
        [fileMediumImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                NSLog(@"Uploaded Medium Profile Picture");
                [[PFUser currentUser] setObject:fileMediumImage forKey:kPAPUserProfilePicMediumKey];
                [[PFUser currentUser] saveEventually];
                
            }
        }];
    }
}

+ (UIImage *)getCurrentUserHeaderImage
{
    PFFile *imageFile = [[PFUser currentUser] objectForKey:kPAPUserProfilePicMediumKey];
    UIImage *image = [UIImage imageWithData:[imageFile getData]];
    if (image) {
        return image;
    }else
    {
        return [UIImage imageNamed:defaultImage];
    }
}



+ (void)sendFeedbackInfo:(NSString *)content withBlock:(feedbackDone)block;
{
    PFObject *huafei = [PFObject objectWithClassName:@"FeedBack"];
    huafei[@"content"] = [NSString stringWithFormat:@"%@",content];

    huafei[@"users"] = [PFUser currentUser];
    [huafei saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            
            block(succeeded);
            
            
        }else
        {
            NSLog(@"%@",error);
        }
    }];

    
}


+ (NSArray *)getFengYunData
{
    PFQuery *query = [PFQuery queryWithClassName:@"FengYunBang"];
    
    //每页最多信息数
    query.limit = 100;
    
    //按时间排序
    [query orderByDescending:@"currentPoints"];
    
    return [query findObjects];
    
}

+ (NSArray *)getChargeList
{
    NSMutableArray *results = [NSMutableArray array];
    
    PFQuery *queryHuaFei = [PFQuery queryWithClassName:@"HuaFei"];
    [queryHuaFei whereKey:@"users" equalTo:[PFUser currentUser]];
    [queryHuaFei orderByAscending:@"createAt"];
    NSArray *tempHuafei = [queryHuaFei findObjects];
    
    PFQuery *queryZhiFuBao = [PFQuery queryWithClassName:@"ZhiFuBao"];
    [queryZhiFuBao whereKey:@"users" equalTo:[PFUser currentUser]];
    [queryZhiFuBao orderByAscending:@"createAt"];
    NSArray *tempZhiFuBao = [queryZhiFuBao findObjects];
    
    [results addObjectsFromArray:tempHuafei];
    [results addObjectsFromArray:tempZhiFuBao];
    
    return results;
}

+ (NSArray *)getGongLueList
{
    PFQuery *query = [PFQuery queryWithClassName:@"GongLue"];
    
    //每页最多信息数
    query.limit = 100;
    
    //按时间排序
    [query orderByDescending:@"currentPoints"];
    
    return [query findObjects];
}

+ (NSArray *)getHelpList
{
    PFQuery *query = [PFQuery queryWithClassName:@"HelpLists"];
    
    //每页最多信息数
    query.limit = 100;
    
    //按时间排序
    [query orderByDescending:@"currentPoints"];
    
    return [query findObjects];
    
}




@end
