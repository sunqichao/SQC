//
//  SQCAPI.m
//  SQC
//
//  Created by sunqichao on 13-12-22.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "SQCAPI.h"
#import "UserInfo.h"
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


#pragma mark - 获取当前积分

+ (NSString *)getCurrentPoints
{
    int youmi = [YouMiPointsManager pointsRemained];
    
    int local = [[[NSUserDefaults standardUserDefaults]objectForKey:localPointsKey] intValue];
    
    int total = youmi + local;
    NSString *currentString = [NSString stringWithFormat:@"积分：%d",total];
    
    
    return currentString;
    
}


+ (id)getCurrentUserEntity
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    NSError *error;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UserInfo"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if ([fetchedObjects count]==0) {
        
        NSLog(@"no UserInfo entity.");
        
    }else
    {
        
        return fetchedObjects;
    }
    
    return nil;
    
}

#pragma mark - 设置用户名称

+ (void)setUserName:(NSString *)namestr
{
    BOOL isSuccess = YES;
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    id userData = [self getCurrentUserEntity];
    if (userData) {
        NSArray *array = (NSArray *)userData;
        UserInfo *infos = [array objectAtIndex:0];
        infos.name = namestr;
        
        NSError *error;
        if (![context save:&error]) {
            isSuccess = NO;
            
        }else{
            isSuccess = YES;
            
        }

    }else
    {
        UserInfo *user = [NSEntityDescription
                          insertNewObjectForEntityForName:@"UserInfo"
                          inManagedObjectContext:context];
        user.name = namestr;
        NSError *error;
        if (![context save:&error]) {
            isSuccess = NO;
            
        }else{
            isSuccess = YES;
            
        }
    }
    
}


#pragma mark - 获取用户名称

+ (NSString *)getCurrentUserName
{
    NSArray *array = [self getCurrentUserEntity];
    if (array) {
        UserInfo *infos = [array objectAtIndex:0];
        NSString *name = [NSString stringWithFormat:@"%@",infos.name];
        return name;
    }
   
    return nil;
}




#pragma mark - 设置摇一摇积分

+ (void)setYaoYiYaoPoints:(NSString *)points
{

    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    NSArray *array = [self getCurrentUserEntity];
    UserInfo *infos = [array objectAtIndex:0];
    infos.yaoyiyaoPoints = points;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"设置摇一摇积分，错误  %@",error);
        
    }else{
        NSLog(@"设置摇一摇积分成功");
        
    }


}

+ (NSString *)getCurrentYaoYiYaoPoints
{
    NSArray *array = [self getCurrentUserEntity];
    if (array) {
        UserInfo *infos = [array objectAtIndex:0];
        NSString *yaoyiyaoPoints = [NSString stringWithFormat:@"%@",infos.yaoyiyaoPoints];
        return yaoyiyaoPoints;
    }
    
    return nil;
    
}

#pragma mark - 设置摇一摇积分的时间 一天只能摇一次

+ (void)setYaoYiYaoPointsDate:(NSString *)date
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    NSArray *array = [self getCurrentUserEntity];
    UserInfo *infos = [array objectAtIndex:0];
    infos.yaoyiyaoDate = date;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"设置摇一摇积分的时间，错误  %@",error);
        
    }else{
        NSLog(@"设置摇一摇积分的时间成功");
        
    }
    
}

+ (NSString *)getCurrentYaoYiYaoPointsDate
{
    NSArray *array = [self getCurrentUserEntity];
    if (array) {
        UserInfo *infos = [array objectAtIndex:0];
        NSString *yaoyiyaoDate = [NSString stringWithFormat:@"%@",infos.yaoyiyaoDate];
        return yaoyiyaoDate;
    }
    
    return nil;

}


#pragma mark - 设置有米积分

+ (void)setYouMiPoints:(NSString *)points
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    NSArray *array = [self getCurrentUserEntity];
    UserInfo *infos = [array objectAtIndex:0];
    infos.youmiPoints = points;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"设置有米积分的时间，错误  %@",error);
        
    }else{
        NSLog(@"设置有米积分的时间成功");
        
    }
    
}

+ (NSString *)getCurrentYouMiPoints
{
    NSArray *array = [self getCurrentUserEntity];
    if (array) {
        UserInfo *infos = [array objectAtIndex:0];
        NSString *youmiPoints = [NSString stringWithFormat:@"%@",infos.youmiPoints];
        return youmiPoints;
    }
    
    return nil;
}


#pragma mark - 设置有米积分

+ (void)setTotalMoney:(NSString *)money
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    NSArray *array = [self getCurrentUserEntity];
    UserInfo *infos = [array objectAtIndex:0];
    infos.totalChangeMoney = money;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"设置所有兑换的钱数，错误  %@",error);
        
    }else{
        NSLog(@"设置所有兑换的钱数");
        
    }

}


+ (NSString *)getTotalMoney
{
    NSArray *array = [self getCurrentUserEntity];
    if (array) {
        UserInfo *infos = [array objectAtIndex:0];
        NSString *totalChangeMoney = [NSString stringWithFormat:@"%@",infos.totalChangeMoney];
        return totalChangeMoney;
    }
    
    return nil;

}









@end
