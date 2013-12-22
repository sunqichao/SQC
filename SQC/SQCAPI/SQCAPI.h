//
//  SQCAPI.h
//  SQC
//
//  Created by sunqichao on 13-12-22.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQCAPI : NSObject


/*
 
 */

///////////

/*
 显示积分墙
 
 */

+ (void)showPointsWall;


/*
 获取当前积分
 
 */

+ (NSString *)getCurrentPoints;



/*
 设置用户名
 
 */

+ (void)setUserName:(NSString *)namestr;



/*
 获取当前用户名
 
 */

+ (NSString *)getCurrentUserName;

+ (id)getCurrentUserEntity;


/*
 设置摇一摇积分
 
 */

+ (void)setYaoYiYaoPoints:(NSString *)points;

+ (NSString *)getCurrentYaoYiYaoPoints;



/*
 设置摇一摇的时间
 
 */

+ (void)setYaoYiYaoPointsDate:(NSString *)date;

+ (NSString *)getCurrentYaoYiYaoPointsDate;



/*
 设置有米的积分
 
 */

+ (void)setYouMiPoints:(NSString *)points;

+ (NSString *)getCurrentYouMiPoints;





/*
 设置所有兑换的钱数
 
 */

+ (void)setTotalMoney:(NSString *)money;

+ (NSString *)getTotalMoney;














@end
