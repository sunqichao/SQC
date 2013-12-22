//
//  SQCDefine.h
//  SQC
//
//  Created by sunqichao on 13-12-22.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#ifndef SQC_SQCDefine_h
#define SQC_SQCDefine_h

#import "AppDelegate.h"

#define refreshBackgroundColor [UIColor colorWithRed:94.0f/255.0f green:103.0f/255.0f blue:122.0f/255.0f alpha:1.0f]

#define DefaultHeaderImage @"u=3112382559,2562752001&fm=21&gp=0.jpg"
#define SQC_appdelegate ((AppDelegate*)[UIApplication sharedApplication].delegate)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define UMAPPKEY @"5268c06b56240b7a6f01668f"        //友盟appkey

#define WXAPPKEY @"wx80750afdd2cf7b69"        //微信appkey

#define MangGuoAppKey @"143503981a9b4ce4851f65a45f704271"       //芒果广告的ID

#define YaoYiYaoKey @"yaoguole"     //取出判断摇一摇是否摇过的key

#define localPointsKey @"loaclPoints"       //本地获取的积分

/**
 
 三人行必有我师    ：       ThreePeopleAndTeacher
 请叫我小清新    ：       SmallWhite
 节操笑话         ：       JieCaoXiaoHua
 
 **/

#define parseClassKeyword @"JieCaoXiaoHua"

#define kPAPUserProfilePicMediumKey @"avatar"

#define kPAPInstallationChannelsKey @"channels"

#define kPAPUserPrivateChannelKey @"channel"

#define sqcSaveNotification @"sqcSaveNotification"

#define sqcSaveNotificationDataKey @"sqcSaveNotificationDataKey"

#define sqcShareNotification @"sqcShareNotification"

#define sqcShareNotificationDataKey @"sqcShareNotificationDataKey"

#define jiazaizhongyaoxianshide @"正在加载中，男淫。。。"      //SQCViewController 里用的等候语

#define jiazaiwanchengyaoxianshide @"好了，看吧，男淫。。。"   //SQCViewController 里用的

#define yaoyiyaoAlertMessage @"亲爱的，你已经获取5个积分，坚持哦。"      //摇一摇用到的提示语

#define yaoyiyaoAlertMessageFailed @"亲爱的，你已经今天摇过了，明天再来吧。"      //摇一摇用到的提示语

typedef void (^writeArticleFinished)(id writedata,BOOL isRight);
typedef void (^readArticleFinished)(id readdata,BOOL isRight);



#endif
