//
//  UserInfo.h
//  SQC
//
//  Created by sun qichao on 14-1-9.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserInfo : NSManagedObject

@property (nonatomic, retain) NSString * currentPoints;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * signUP;
@property (nonatomic, retain) NSString * totalChangeMoney;
@property (nonatomic, retain) NSString * yaoyiyaoDate;
@property (nonatomic, retain) NSString * yaoyiyaoPoints;
@property (nonatomic, retain) NSString * youmiPoints;
@property (nonatomic, retain) NSString * totalChangeMoneyHuafei;
@property (nonatomic, retain) NSString * totalChangeMoneyZhiFuBao;

@end
