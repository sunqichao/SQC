//
//  CoreDataManager.m
//  SQC
//
//  Created by sun qichao on 14-1-9.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import "CoreDataManager.h"
#import "UserInfo.h"
@implementation CoreDataManager
#pragma mark - 设置用户名称

+ (void)setUserName:(NSString *)namestr
{
    BOOL isSuccess = YES;
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    UserInfo *infos = [self getCurrentUserEntity];
    if (infos) {
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
    UserInfo *infos = [self getCurrentUserEntity];
    if (infos.name) {
        NSString *name = [NSString stringWithFormat:@"%@",infos.name];
        return name;
    }
    
    return nil;
}

#pragma mark - 获取用户实例

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
        
        return [fetchedObjects objectAtIndex:0];
    }
    
    return nil;
    
}

#pragma mark - 设置兑换话费总额

+ (void)setTotalHuaFeiMoney:(int)money
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    UserInfo *infos = [self getCurrentUserEntity];

    NSString *totalMoneyHuafei = [NSString stringWithFormat:@"%d",([infos.totalChangeMoneyHuafei intValue]+money)];

    infos.totalChangeMoneyHuafei = totalMoneyHuafei;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"话费总额，错误  %@",error);
        
    }else{
        NSLog(@"话费总额保存成功");
        
    }
    
}
#pragma mark - 设置兑换支付宝总额

+ (void)setTotalZhiFuBaoMoney:(int)money
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    UserInfo *infos = [self getCurrentUserEntity];
    
    NSString *totalMoneyZhiFuBao = [NSString stringWithFormat:@"%d",([infos.totalChangeMoneyZhiFuBao intValue]+money)];

    infos.totalChangeMoneyZhiFuBao = totalMoneyZhiFuBao;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"支付宝总额，错误  %@",error);
        
    }else{
        NSLog(@"支付宝总额保存成功");
        
    }
    
}

#pragma mark - 获取当前已经兑换话费得金额

+ (NSString *)getCurrentChangedHuafei
{
    UserInfo *infos = [self getCurrentUserEntity];
    if (infos.totalChangeMoneyHuafei) {
        NSString *totalChangeMoneyHuafei = [NSString stringWithFormat:@"%@",infos.totalChangeMoneyHuafei];
        return totalChangeMoneyHuafei;
    }
    
    return @"0";
    
}

#pragma mark - 获取当前已经兑换支付宝得金额

+ (NSString *)getCurrentChangedZhiFuBao
{
    UserInfo *infos = [self getCurrentUserEntity];
    if (infos.totalChangeMoneyZhiFuBao) {
        NSString *totalChangeMoneyZhiFuBao = [NSString stringWithFormat:@"%@",infos.totalChangeMoneyZhiFuBao];
        return totalChangeMoneyZhiFuBao;
    }
    
    return @"0";
}

#pragma mark - 设置注册的状态

+ (void)setSignUpSuccessed:(NSString *)sign
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    UserInfo *infos = [self getCurrentUserEntity];
    infos.signUP = sign;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"注册失败，错误  %@",error);
        
    }else{
        NSLog(@"注册成功");
        
    }
}

#pragma mark - 获取注册的状态，ok表示注册成功了

+ (NSString *)getSignUpSuccessed
{
    UserInfo *infos = [self getCurrentUserEntity];
    if (infos.signUP) {
        NSString *signUP = [NSString stringWithFormat:@"%@",infos.signUP];
        return signUP;
    }
    
    return @"0";
    
}



#pragma mark - 获取当前积分

+ (NSString *)getCurrentPoints
{
    UserInfo *infos = [self getCurrentUserEntity];
    if (infos.yaoyiyaoPoints) {
        NSString *currentPoints = [NSString stringWithFormat:@"%d",([infos.yaoyiyaoPoints intValue]+[[CoreDataManager getCurrentYouMiPoints] intValue])];
        return currentPoints;
    }
    
    return @"0";
}


#pragma mark - 设置摇一摇积分

+ (void)setYaoYiYaoPoints:(NSString *)points
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    UserInfo *infos = [self getCurrentUserEntity];
    
    NSString *totalPoints = [NSString stringWithFormat:@"%d",([infos.yaoyiyaoPoints intValue]+[points intValue])];
    
    infos.yaoyiyaoPoints = totalPoints;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"设置摇一摇积分，错误  %@",error);
        
    }else{
        NSLog(@"设置摇一摇积分成功");
        [SQCAPI sendAllUserInfomations];
    }
    
    
}

#pragma mark - 获得当前摇一摇积分

+ (NSString *)getCurrentYaoYiYaoPoints
{
    UserInfo *infos = [self getCurrentUserEntity];
    if (infos.yaoyiyaoPoints) {
        NSString *yaoyiyaoPoints = [NSString stringWithFormat:@"%@",infos.yaoyiyaoPoints];
        return yaoyiyaoPoints;
    }
    
    return @"0";
    
}

#pragma mark - 消费当前摇一摇积分

+ (void)spendYaoYiYaoPoints:(NSString *)points
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    UserInfo *infos = [self getCurrentUserEntity];
    
    NSString *totalPoints = [NSString stringWithFormat:@"%d",([infos.yaoyiyaoPoints intValue]-[points intValue])];
    
    infos.yaoyiyaoPoints = totalPoints;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"消费摇一摇积分，错误  %@",error);
        
    }else{
        NSLog(@"消费摇一摇积分成功");
    }

}

#pragma mark - 设置摇一摇积分的时间 一天只能摇一次

+ (void)setYaoYiYaoPointsDate:(NSString *)date
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    UserInfo *infos = [self getCurrentUserEntity];
    infos.yaoyiyaoDate = date;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"设置摇一摇积分的时间，错误  %@",error);
        
    }else{
        NSLog(@"设置摇一摇积分的时间成功");
        
    }
    
}

#pragma mark - 获取摇一摇的时间 和当前一样说明摇过了

+ (NSString *)getCurrentYaoYiYaoPointsDate
{
    UserInfo *infos = [self getCurrentUserEntity];
    if (infos.yaoyiyaoDate) {
        NSString *yaoyiyaoDate = [NSString stringWithFormat:@"%@",infos.yaoyiyaoDate];
        return yaoyiyaoDate;
    }
    
    return @"0";
    
}



+ (NSString *)getCurrentYouMiPoints
{
    NSString *youmiPoints = [NSString stringWithFormat:@"%d",[YouMiPointsManager pointsRemained]];

    
    return youmiPoints;
}

#pragma mark - 设置获取兑换总金额

+ (void)setTotalMoney:(NSString *)money
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    UserInfo *infos = [self getCurrentUserEntity];
    
    NSString *totalMoney = [NSString stringWithFormat:@"%d",([infos.totalChangeMoney intValue]+[money intValue])];
    
    infos.totalChangeMoney = totalMoney;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"设置所有兑换的钱数，错误  %@",error);
        
    }else{
        NSLog(@"设置所有兑换的钱数");
        [SQCAPI sendAllUserInfomations];
    }
    
}


+ (NSString *)getTotalMoney
{
    UserInfo *infos = [self getCurrentUserEntity];
    if (infos.totalChangeMoney) {
        NSString *totalChangeMoney = [NSString stringWithFormat:@"%@",infos.totalChangeMoney];
        return totalChangeMoney;
    }
    
    return @"0";
    
}



@end
