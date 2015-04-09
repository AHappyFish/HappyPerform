//
//  HPComment.h
//  笑兜兜
//
//  Created by shaun on 14-8-12.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPComment : NSObject
/*  "recent_comments": [
{
    "uid": 0,
    "text": "别担心，明天就会死的 // @老板来碗稀饭一碟咸菜一笼包子再加两个卤蛋: 劳资就是不死之身，自从生下来就没死过。",
    "create_time": 1407794083,
    "user_digg": 0,
    "id": 3456807611,
    "user_bury": 0,
    "user_profile_url": "",
    "user_id": 3369197753,
    "bury_count": 0,
    "description": "这个用户很懒，神马都木有写",
    "digg_count": 2,
    "user_verified": false,
    "platform": "feifei",
    "user_name": "丶LOVE灬LiangLiXue",
    "user_profile_image_url": "http://p2.pstatp.com/thumb/1044/6816341486"
},*/
/*评论正文*/
@property (nonatomic ,copy) NSString *text;

/* 创建时间*/
@property (nonatomic ,strong) NSNumber *create_time;

/* 评论的用户名 */
@property (nonatomic ,copy) NSString *user_name;

/*  评论用户的头像  */
@property (nonatomic ,copy) NSString *user_profile_image_url;

@end
