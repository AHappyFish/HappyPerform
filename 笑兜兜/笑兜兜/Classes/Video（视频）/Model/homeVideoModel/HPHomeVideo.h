//
//  HPHomeVideo.h
//  笑兜兜
//
//  Created by dyf on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPHomeVideo : NSObject

/**
 {
 "id": "1",
 "name": "\u7b2c\u4e00\u5b63",
 "pic": "http:\/\/i2.tdimg.com\/068\/582\/993\/m20.jpg",
 "info": 67
 }
 */

/**
 *  为了排序用到标识,默认从1递增,点击倒序后,总最大递减.重新刷新 tableView 会
 */
@property (nonatomic, copy) NSString *id;
/**
 *  第 X 季
 */
@property (nonatomic, copy) NSString *name;
/**
 *  图片 url
 */
@property (nonatomic, copy) NSString *pic;
/**
 *   什么信息??不懂.(long)NSNumber
 */
@property (nonatomic, strong) NSNumber *info;
@end
