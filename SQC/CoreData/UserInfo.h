//
//  UserInfo.h
//  SQC
//
//  Created by sunqichao on 13-12-22.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserInfo : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * currentPoints;
@property (nonatomic, retain) NSString * yaoyiyaoPoints;
@property (nonatomic, retain) NSString * youmiPoints;
@property (nonatomic, retain) NSString * totalChangeMoney;
@property (nonatomic, retain) NSString * yaoyiyaoDate;

@end
