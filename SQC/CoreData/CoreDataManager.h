//
//  CoreDataManager.h
//  SQC
//
//  Created by sun qichao on 14-1-9.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject


/*
 设置用户名  获取用户名
 
 */

+ (void)setUserName:(NSString *)namestr;

+ (NSString *)getCurrentUserName;

+ (id)getCurrentUserEntity;

/*
 设置是否注册成功
 
 */

+ (void)setSignUpSuccessed:(NSString *)points;

+ (NSString *)getSignUpSuccessed;

/*
 设置兑换总金额
 
 */

+ (void)setTotalMoney:(NSString *)money;

+ (NSString *)getTotalMoney;

/*
 设置和获取当前已经兑换话费得钱数
 
 */
+ (void)setTotalHuaFeiMoney:(int)money;

+ (NSString *)getCurrentChangedHuafei;

/*
 设置和获取当前已经兑换支付宝得钱数
 
 */
+ (void)setTotalZhiFuBaoMoney:(int)money;

+ (NSString *)getCurrentChangedZhiFuBao;

/*
 设置和获取当前当前积分
 
 */
+ (void)setCurrentPoints:(NSString *)points;

+ (NSString *)getCurrentPoints;


/*
 设置摇一摇积分
 
 */

+ (void)setYaoYiYaoPoints:(NSString *)points;

+ (NSString *)getCurrentYaoYiYaoPoints;

+ (void)spendYaoYiYaoPoints:(NSString *)points;


/*
 设置摇一摇的时间
 
 */

+ (void)setYaoYiYaoPointsDate:(NSString *)date;

+ (NSString *)getCurrentYaoYiYaoPointsDate;



/*
 设置有米的积分 （不能自己设置，容易出错）
 
 */

+ (NSString *)getCurrentYouMiPoints;



@end
