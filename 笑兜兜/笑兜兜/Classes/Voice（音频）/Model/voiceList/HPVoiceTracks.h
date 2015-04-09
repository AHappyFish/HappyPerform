//
//  HPVoiceTracks.h
//  笑兜兜
//
//  Created by shaun on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//
/*
 maxPageId": 10,
 "pageId": 1,
 "pageSize": 3,
 "totalCount": 28
 */

#import <Foundation/Foundation.h>
@interface HPVoiceTracks : NSObject

@property (nonatomic, strong) NSArray *list;

@property (nonatomic, copy) NSNumber *maxPageId;

@property (nonatomic, copy) NSNumber *pageId;

@property (nonatomic, copy) NSNumber *pageSize;

@property (nonatomic, copy) NSNumber *totalCount;



@end
