//
//  HPEntertainmentParam.h
//  笑兜兜
//
//  Created by shaun on 14-8-4.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//  综艺娱乐请求参数

#import <Foundation/Foundation.h>
/**category 	string 	entertainment
 device 	string 	设备，比如iPhone
 type 	string 	album*/

@interface HPCategoryParam : NSObject

@property (nonatomic, copy) NSString *category;

/** 标题 */
@property (nonatomic, copy) NSString *device;

/** 图片地址 */
@property (nonatomic, copy) NSString *type;

@end
