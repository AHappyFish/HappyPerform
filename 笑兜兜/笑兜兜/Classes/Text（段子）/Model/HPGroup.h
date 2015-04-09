//
//  HPGroup.h
//  笑兜兜
//
//  Created by shaun on 14-7-31.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//  段子类

#import <Foundation/Foundation.h>
@class HPUser;
@interface HPGroup : NSObject

/** 段子正文 */
@property (nonatomic, copy) NSString *content;

/** 评论数 */
@property (nonatomic, assign) NSInteger comment_count;

/** 点赞数 */
@property (nonatomic, assign) NSInteger digg_count;

/** 不支持 点踩的个数 */
@property (nonatomic, assign) NSInteger bury_count;

/** 分享段子的url地址 */
@property (nonatomic, copy) NSString *share_url;

/** 等级 */
@property (nonatomic, assign) NSInteger level;

/** 创建时间 */
@property (nonatomic, strong) NSString *create_time;

/** 发段子的用户 */
@property (nonatomic, strong) HPUser *user;
@end
