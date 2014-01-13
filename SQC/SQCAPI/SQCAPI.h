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
 
 获取今天摇一摇的积分

 */
+ (NSString *)getYaoYiYaoPoints;

/*
 
 注册
 
 */
+ (void)signUpWithName:(NSString *)name;

/*
 
 发送用户的积分，兑换金额，等等信息到服务端
 
 */
+ (void)sendAllUserInfomations;


/*
 
 发送一条充话费的记录
 
 */
+ (void)sendHuafeiMoney:(int)money number:(NSString *)phoneNumber;

/*
 
 发送一条支付宝充值的记录
 
 */
+ (void)sendZhifubaoMoney:(int)money account:(NSString *)account;


/*
 判断积分是否达到标准
 
 */

+ (BOOL)isEnoughPointsWith:(int)money;


/*
 设置用户头像
 
 */
+ (void)setUserHeaderImage:(UIImage *)image;

+ (UIImage *)getCurrentUserHeaderImage;



/*
 发送反馈信息到服务器
 
 */
+ (void)sendFeedbackInfo:(NSString *)content withBlock:(feedbackDone)block;


/*
 获取风云榜信息
 
 */
+ (NSArray *)getFengYunData;

/*
 获取兑换纪录（包括兑换状态)
 */

+ (NSArray *)getChargeList;

/*
 获取攻略列表
 */

+ (NSArray *)getGongLueList;

/*
 获取帮助列表
 */

+ (NSArray *)getHelpList;





@end
