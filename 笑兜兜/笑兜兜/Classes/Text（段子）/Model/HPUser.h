//
//  HPUser.h
//  笑兜兜
//
//  Created by shaun on 14-7-31.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//  用户类 

#import <Foundation/Foundation.h>

@interface HPUser : NSObject
/*
"avatar_url": "http://tp4.sinaimg.cn/1879131067/50/5640581426/1", // 用户头像
"user_id": 1256371642, // 用户id
"name": "\u9171\u6cb9\u7537\u8def\u8fc7", // 用户昵称
"user_verified": false
 */

/** 头像 */
@property (nonatomic, copy) NSString *avatar_url;

/** 用户id */
@property (nonatomic, strong) NSNumber *user_id;


/** 用户昵称 */
@property (nonatomic, copy) NSString *name;

/**  */
//@property (nonatomic, assign) BOOL *user_verified;

@end
