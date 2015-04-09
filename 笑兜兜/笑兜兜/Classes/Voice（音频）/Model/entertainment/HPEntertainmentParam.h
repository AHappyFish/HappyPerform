//
//  HPEntertainmentSingleParam.h
//  笑兜兜
//
//  Created by shaun on 14-8-5.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//  点击collectionView中的每个item的请求参数

#import <Foundation/Foundation.h>


@interface HPEntertainmentParam : NSObject

/**category_name=entertainment&condition=hot&device=iPhone&page=1&per_page=20&status=0&tag_name=冷笑话*/

/** 类别 */
@property (nonatomic, copy) NSString *category_name;

/** 设备 */
@property (nonatomic, copy) NSString *device;

/** 条件：最热(hot)、最近更新 */
@property (nonatomic, copy) NSString *condition;

/** 页码 */
@property (nonatomic, copy) NSNumber *page;

/** 每一页的个数 */
@property (nonatomic, copy) NSNumber *per_page;

/**  */
@property (nonatomic, copy) NSNumber *status;

/** 请求的内容 */
@property (nonatomic, copy) NSString *tag_name;

@end
