//
//  HPEntertainmentResult.h
//  笑兜兜
//
//  Created by shaun on 14-8-4.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//  综艺娱乐请求结果

#import <Foundation/Foundation.h>



@interface HPCategoryResult : NSObject

/** count */
@property (nonatomic, copy) NSNumber *count;

/** 最大页码 */
@property (nonatomic, copy) NSNumber *maxPageId;

@property (nonatomic, strong) NSArray *list;

/** ret */
@property (nonatomic, copy) NSNumber *ret;
@end
