//
//  HPEntertainmentResult.h
//  笑兜兜
//
//  Created by shaun on 14-8-5.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPEntertainmentResult : NSObject

/** 数据个数 */
@property (nonatomic, copy) NSNumber *count;

/** 模型数据 */
@property (nonatomic, strong) NSArray *list;

/** 最大页码 */
@property (nonatomic, copy) NSNumber *maxPageId;

/**  */
@property (nonatomic, copy) NSNumber *ret;

@end
